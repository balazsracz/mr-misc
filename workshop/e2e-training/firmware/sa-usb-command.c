#include <xc.h>
#include <htc.h>

#include <stdint.h>
#include "usb_serial_lib.h"

// This magic is needed for the bootloader to accept our program. If we had a
// more recent flash utility it could be removed.
#asm
PSECT myofs,abs
org 0x1006
dw 0x600D
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

State state;

volatile uint8_t counter = 0;

volatile uint8_t red_bri = 0;
volatile uint8_t gre_bri = 0;
volatile uint8_t yel_bri = 0;
volatile uint8_t rgb_r_bri = 0;
volatile uint8_t rgb_g_bri = 0;
volatile uint8_t rgb_b_bri = 0;

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

char usb_buf[8];

void main(void)
{
  init();

  InitializeUSBSystem();
  // Overflows in half a second.
  TMR0 = 42098;
  while (1) {
    red_bri = state == STATE_RED ? 10 : 0;
    gre_bri = state == STATE_GRE ? 10 : 0;
    yel_bri = state == STATE_YEL ? 30 : 0;
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }

    uint8_t count = getsUSBUSART(usb_buf,sizeof(usb_buf));
    for (int i = 0; i < count; ++i) {
      parseinput(usb_buf[i]);
    }


    if (mUSBUSARTIsTxTrfReady()) {
      // We can write back to the host.
      for (uint8_t i = 0; i < count; ++i) {
        if ('a' <= usb_buf[i] && usb_buf[i] < 'z') {
          usb_buf[i] += 1;
        }
        putUSBUSART(usb_buf, count);
      }
    }

    CDCTxService();
    USBDeviceTasks();
  }
}
