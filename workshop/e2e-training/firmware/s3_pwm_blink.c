#include <xc.h>
#include <htc.h>

#include <stdint.h>

// This magic is needed for the bootloader to accept our program. If we had a
// more recent flash utility it could be removed.
#asm
PSECT reset_vec
org 0x2
dw 0x600D
#endasm


bit red_on;
bit yellow_on;
bit green_on;

uint8_t red_brightness = 10;
uint8_t yellow_brightness = 5;
uint8_t green_brightness = 5;

uint8_t rgb[3];

void init(void)
{
  // port directions: 1=input, 0=output
 // ANSEL = 0;
 // ANSELH = 0;  
  TRISC = 0b00000000;
  WPUB4 = 1;
  WPUB5 = 1;
  WPUB6 = 1;
}
char counter;

unsigned char load_instruction(int ip) {
  return EEPROM_READ(ip);
}

uint8_t br_counter = 0;

void interrupt isr(void) {
  if (TMR2IF) {
    TMR2IF = 0;
    ++br_counter;
    LATC3 = red_on && (br_counter < red_brightness) ? 1 : 0;
    LATC4 = yellow_on && (br_counter < yellow_brightness) ? 1 : 0;
    LATC5 = green_on && (br_counter < green_brightness) ? 1 : 0;

    LATC0 = br_counter < rgb[2] ? 1 : 0;
    LATC1 = br_counter < rgb[1] ? 1 : 0;
    LATC2 = br_counter < rgb[0] ? 1 : 0;
  }
}


     /*
  asm("clrf _TBLPTRU, 0");
  movlb 23
  movlb (_ip) >> 8
  movf (_ip) & 0xff, w, 1
  movwf _TBLPTRL,1
  movf (_ip + 1) & 0xff, w, 1
  addlw 0x20
  movwf _TBLPRTH, 1
  TBLRD*
  movf _TABLAT, w, 0*/


void main(void)
{
  init();
  int ip = 0;
  int counter = 0;
  TRISC = 0;
  LATC = 0;
  ANSEL = 0;
  ANSELH = 0;
  T0CON = 0b10000111;
  T2CON = 0b00000110;
  PR2 = 48;
  rgb[0] = 0;
  rgb[1] = 0;
  rgb[2] = 0;
  TMR2IE = 1;
  PEIE = 1;
  GIE = 1;

  C1OE = 0;
  C2OE = 0;
  //TMR0 = 42098;
  while (1){
    if (TMR0IF) {
      TMR2IF = 1;
      TMR0IF = 0;
      TMR0 = 42098;
      ++counter;
      red_on = counter & 1;
      yellow_on = counter & 2 ? 1 : 0;
      green_on = counter & 4 ? 1 : 0;
      rgb[0] = red_on ? 10 : 0;
      rgb[1] = green_on ? 10 : 0;
      rgb[2] = yellow_on ? 10 : 0;
    }
    if (!PORTBbits.RB5) {
      PEIE = 0;
      GIE = 0;
      LATC = 0;
#asm
      goto 0x001C
#endasm
    }
  }
}
