#include <xc.h>
#include <htc.h>

#include <stdint.h>

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

void main(void)
{
  init();
  uint8_t counter = 0;
  // Overflows in half a second.
  TMR0 = 42098;
  while (1) {
    if (TMR0IF) {
      TMR0IF = 0;
      // Homework ~~~~
      //
      // problem: if there is something else in the loop that takes a long
      // time, this causes timer skew (i.e. our period will be longer than
      // desired).
      //
      // Find a solution!
      TMR0 = 42098;
      ++counter;
    }
    LED_GRE = counter & 1;
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
  }
}
