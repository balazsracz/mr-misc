#include <xc.h>
#include <htc.h>

#include <stdint.h>
//#include <pic.h>


/*
__CONFIG(1, OSC_INT_RC & PLLEN_OSCILLATOR_USED_DIRECTLY & FCMEN_DISABLED
         & IESO_DISABLED);
__CONFIG(2, nPWRTEN_ENABLED & BOREN_ENABLED_IN_HARDWARE__SBOREN_DISABLED
         & BORV_1_9V & WDTEN_DISABLED_CONTROLLED_BY_SWDTEN_BIT);
__CONFIG(3, HFOFST_HFINTOSC_STARTS_CLOCKING_THE_CPU_WITHOUT_WAITING_FOR_THE_OSCILLATOR_TO_STABILIZE
         & MCLRE_MCLR_DISABLED_RE3_ENABLED);
//__CONFIG(4, STVREN_ENABLED & LVP_DISABLED & BBSIZ_512_W_BOOT_BLOCK_SIZE & XINST_DISABLED & BACKBUG_ENABLED);
__CONFIG(4, 0x0001);
__CONFIG(5, CP_0_DISABLED & CP_1_DISABLED & CPB_DISABLED & CPD_DISABLED);
__CONFIG(6, WRT_0_DISABLED & WRT_1_DISABLED);
__CONFIG(7, WRTC_DISABLED & WRTB_DISABLED & WRTD_DISABLED
         & EBTR_0_DISABLED & EBTR_1_DISABLED & EBTRB_DISABLED);
*/


#define TEST(x) sizeof(x)


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
