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
  uint8_t counter = 0;
  while (1) {
    if (!BUT_RED) st = STATE_RED;
    if (!BUT_YEL) st = STATE_YEL;
    if (!BUT_GRE) st = STATE_GRE;
    LED_RED = st == STATE_RED;// ? 1 : 0;
    LED_YEL = st == STATE_YEL;// ? 1 : 0;
    LED_GRE = st == STATE_GRE;// ? 1 : 0;
    RGB_RED = !BUT_RED;
    RGB_GRE = !BUT_GRE;
    RGB_BLU = !BUT_YEL;
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
  }
}
