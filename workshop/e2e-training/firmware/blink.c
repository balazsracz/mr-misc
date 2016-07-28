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
  init();
  uint8_t counter = 0;
  while (1){
    ++counter;
    LATC0 = counter & 1;
    mydelay(100000);
    if (!PORTBbits.RB5 && !PORTBbits.RB6) {
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
  }
}
