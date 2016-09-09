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
  //T0CON = 0b10000111;

  // Timer 2: enabled, no postscaler, 1:16 prescaler
  //T2CON = 0b00000110;
  // Ticks about 60 * 256 times per second
  //PR2 = 48;


  //PEIE = 1;
  //GIE = 1;
  //TMR2IE = 1;
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

State st;

volatile uint8_t counter = 0;

volatile uint8_t red_bri = 0;
volatile uint8_t gre_bri = 0;
volatile uint8_t yel_bri = 0;

/*
void interrupt irq() {
  if (TMR2IF) {
    TMR2IF = 0;
    ++counter;
    LED_RED = counter < red_bri;
    LED_GRE = counter < gre_bri;
    LED_YEL = counter < yel_bri;
  }
  }*/

void main(void)
{
  init();

  InitializeUSBSystem();
  // Overflows in half a second.
  //TMR0 = 42098;
  while (1) {
#if 0
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
#endif


    CDCTxService();
    USBDeviceTasks();
  }
}
