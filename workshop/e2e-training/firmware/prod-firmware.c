#include <xc.h>
#include <htc.h>

#include <stdint.h>
#include "usb_serial_lib.h"
#include <eeprom_routines.h>

// This magic is needed for the bootloader to accept our program. If we had a
// more recent flash utility it could be removed.
#asm
PSECT myofs,abs
org 0x1006
dw 0x600D
org 0x3FFE
dw 0xFFFF
#endasm

void ignorefn() {}

#define BUT_RED (PORTBbits.RB6)
#define BUT_YEL (PORTBbits.RB5)
#define BUT_GRE (PORTBbits.RB4)

#define LED_RED LATC3
#define LED_YEL LATC4
#define LED_GRE LATC5

#define RGB_RED LATC2
#define RGB_GRE LATC1
#define RGB_BLU LATC0

void init(void)
{
  LATC = 0;
  TRISC = 0;

  // Timer 0: enabled, 16-bit, internal clock, prescaler enabled with 1:256
  // ratio.
  T0CON = 0b10000111;

  // Timer 2: enabled, no postscaler, 1:16 prescaler
  T2CON = 0b00000110;
  // Ticks about 60 * 256 times per second
  PR2 = 48;


  PEIE = 1;
  GIE = 1;
  TMR2IE = 1;
}

void mydelay(long t) {
  for (long i = 0; i < t; ++i) ;
}

typedef enum {
  STATE_NONE,
  STATE_RED,
  STATE_YEL,
  STATE_GRE
} State;

State state = STATE_NONE;

typedef enum {
  EE_RED_BRI = 0,
  EE_YEL_BRI,
  EE_GRE_BRI,
} EepromLayout;

volatile uint8_t counter = 0;

volatile uint8_t red_bri = 0;
volatile uint8_t gre_bri = 0;
volatile uint8_t yel_bri = 0;
volatile uint8_t rgb_r_bri = 0;
volatile uint8_t rgb_g_bri = 0;
volatile uint8_t rgb_b_bri = 0;
uint8_t cfg_red_bri;
uint8_t cfg_yel_bri;
uint8_t cfg_gre_bri;

void interrupt irq() {
  if (TMR2IF) {
    TMR2IF = 0;
    ++counter;
    LED_RED = counter < red_bri;
    LED_GRE = counter < gre_bri;
    LED_YEL = counter < yel_bri;
    RGB_RED = counter < rgb_r_bri;
    RGB_GRE = counter < rgb_g_bri;
    RGB_BLU = counter < rgb_b_bri;
  }
}

bit parseerror = 0;
bit respond_pong = 0;
bit respond_state = 0;
bit respond_cfg = 0;

uint8_t parsehexdigit(char d) {
  if ('0' <= d && d <= '9') {
    return d - '0';
  }
  if ('a' <= d && d <= 'f') {
    return d - 'a' + 10;
  }
  if ('A' <= d && d <= 'F') {
    return d - 'A' + 10;
  }
  parseerror = 1;
  return 0;
}

uint8_t parsehex(char h, char l) {
  return (parsehexdigit(h) << 4) + parsehexdigit(l);
}

typedef enum {
  PST_DEAD,
  PST_CMD,
  PST_ARG
} ParseState;

ParseState parse_st = PST_CMD;

#define COMMAND_MAX_LEN 8
char command[COMMAND_MAX_LEN + 1];
uint8_t command_ofs = 0;

#define ARG_MAX_LEN 16
char arg[ARG_MAX_LEN + 1];
uint8_t arg_ofs;

void ewrite(uint8_t addr, uint8_t value) {
  while (WR)
    continue;
  EEADR = (addr);
  EEDATA = (value);
  EECON1 &= 0x3F;
  CARRY = 0;
  if (GIE)
    CARRY = 1;
  GIE = 0;
  WREN = 1;
  EECON2 = 0x55;
  EECON2 = 0xAA;
  WR = 1;
  WREN = 0;
  if (CARRY)
    GIE = 1;
}

uint8_t eread(uint8_t addr) {
  while (WR)
    ;
  EEADR = addr;
  EECON1 &= 0x3F;
  RD = 1;
  return EEDATA;
}

void command_execute() {
  command[command_ofs] = 0;
  if (strncmp(command, "rgb", COMMAND_MAX_LEN) == 0) {
    rgb_r_bri = parsehex(arg[0], arg[1]);
    rgb_g_bri = parsehex(arg[2], arg[3]);
    rgb_b_bri = parsehex(arg[4], arg[5]);
  } else if (strncmp(command, "red", COMMAND_MAX_LEN) == 0) {
    state = STATE_RED;
  } else if (strncmp(command, "yellow", COMMAND_MAX_LEN) == 0) {
    state = STATE_YEL;
  } else if (strncmp(command, "green", COMMAND_MAX_LEN) == 0) {
    state = STATE_GRE;
  } else if (strncmp(command, "ping", COMMAND_MAX_LEN) == 0) {
    respond_pong = 1;
  } else if (strncmp(command, "getcfg", COMMAND_MAX_LEN) == 0) {
    respond_cfg = 1;
  } else if (strncmp(command, "rbri", COMMAND_MAX_LEN) == 0) {
    cfg_red_bri = parsehex(arg[0], arg[1]);
    ewrite(EE_RED_BRI, cfg_red_bri);
  } else if (strncmp(command, "ybri", COMMAND_MAX_LEN) == 0) {
    cfg_yel_bri = parsehex(arg[0], arg[1]);
    ewrite(EE_YEL_BRI, cfg_yel_bri);
  } else if (strncmp(command, "gbri", COMMAND_MAX_LEN) == 0) {
    cfg_gre_bri = parsehex(arg[0], arg[1]);
    ewrite(EE_GRE_BRI, cfg_gre_bri);
  }
}

void parseinput(char c) {
  if (c == '\n' || c == '\r') {
    command_execute();
    parse_st = PST_CMD;
    command_ofs = 0;
    return;
  }
  switch(parse_st) {
    case PST_DEAD:
      return;
    case PST_CMD:
      if (c == ' ') {
        command[command_ofs] = 0;
        parse_st = PST_ARG;
        arg_ofs = 0;
        return;
      }
      if (command_ofs < COMMAND_MAX_LEN) {
        command[command_ofs++] = c;
      }
      return;
    case PST_ARG:
      if (arg_ofs < ARG_MAX_LEN) {
        arg[arg_ofs++] = c;
        arg[arg_ofs] = 0;
      }
      return;
  }
}

char hexdigit(uint8_t d) {
  if (d < 10) return '0' + d;
  return 'a' + d - 10;
}

void printhex(uint8_t value, char* buf) {
  buf[0] = hexdigit(value >> 4);
  buf[1] = hexdigit(value & 0xf);
}

char usb_buf[8];

void send_const_string(const ROM char* data) {
  int l = strlen(data);
  mUSBUSARTTxRom(data, l);
}

void send_any_response() {
  if (parseerror) {
    parseerror = 0;
    send_const_string("error\n");
    return;
  }
  if (respond_pong) {
    respond_pong = 0;
    send_const_string("pong\n");
    return;
  }
  if (respond_state) {
    respond_state = 0;
    switch (state) {
    case STATE_RED: 
      send_const_string("red\n");
      break;
    case STATE_YEL: 
      send_const_string("yellow\n");
      break;
    case STATE_GRE: 
      send_const_string("green\n");
      break;
    }
    return;
  }
  if (respond_cfg) {
    respond_cfg = 0;
    printhex(cfg_red_bri, usb_buf);
    printhex(cfg_yel_bri, usb_buf + 2);
    printhex(cfg_gre_bri, usb_buf + 4);
    usb_buf[6] = '\n';
    usb_buf[7] = 0;
    putUSBUSART(usb_buf, 7);
  }
}


#define kHalfSecondTimer 42098
void main(void)
{
  init();

  cfg_red_bri = eread(EE_RED_BRI);
  cfg_yel_bri = eread(EE_YEL_BRI);
  cfg_gre_bri = eread(EE_GRE_BRI);
  if (!cfg_red_bri) cfg_red_bri = 0xff;
  if (!cfg_gre_bri) cfg_gre_bri = 0xff;
  if (!cfg_yel_bri) cfg_yel_bri = 0xff;

  InitializeUSBSystem();
  // Overflows in half a second.
  TMR0 = kHalfSecondTimer;
  while (1) {
    red_bri = state == STATE_RED ? cfg_red_bri : 0;
    gre_bri = state == STATE_GRE ? cfg_gre_bri : 0;
    yel_bri = state == STATE_YEL ? cfg_yel_bri : 0;
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }

    if (!BUT_RED && state != STATE_RED) {
      state = STATE_RED;
      respond_state = 1;
    } else if (!BUT_YEL && state != STATE_YEL) {
      state = STATE_YEL;
      respond_state = 1;
    } else if (!BUT_GRE && state != STATE_GRE) {
      state = STATE_GRE;
      respond_state = 1;
    }

    USBDeviceTasks();

    // If usb is disconnected, we blink yellow.
    if((USBDeviceState < CONFIGURED_STATE)||(USBSuspendControl==1)) {
      static bit flip = 0;
      if (TMR0IF) {
        TMR0IF = 0;
        TMR0 = kHalfSecondTimer;
        flip = !flip;
      }
      yel_bri = flip ? cfg_yel_bri : 0;
      continue;
    }

    uint8_t count = getsUSBUSART(usb_buf,sizeof(usb_buf));
    for (int i = 0; i < count; ++i) {
      parseinput(usb_buf[i]);
    }

    if (mUSBUSARTIsTxTrfReady()) {
      // We can write back to the host.
      send_any_response();
    }

    CDCTxService();
  }
}
