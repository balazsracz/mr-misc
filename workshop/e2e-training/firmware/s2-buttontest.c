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

void main(void)
{
  uint8_t counter = 0;
  while (1){
    ++counter;
    LED_RED = RGB_RED = !BUT_RED;
    LED_GRE = RGB_GRE = !BUT_GRE;
    LED_YEL = RGB_BLU = !BUT_YEL;
    if (!BUT_RED && !BUT_YEL) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
  }
}
