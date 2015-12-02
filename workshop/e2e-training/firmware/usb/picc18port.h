/********************************************************************

Microchip USB stack - USB CDC Serial Emulator port to PICC18 PRO

2010/01/06 - Simon Inns
http://www.waitingforfriday.com

This is a port of the USB serial emulator demo from MCHPFSUSB stack
version 2.6 from Microchip C18 to HI-TECH PICC18 PRO version 9.63

It will *only* work on a PICDEM FS USB board; however adapting to 
other boards should be straight-forward.  It also serves as an
example of how to port over other device types.

Be careful of the hardcoded absolute memory locations though, I
haven't found any good way to replicate C18's pragma udata
functionality, so these will need to be manually altered if 
required.

You can easily see all the required alterations by using 'find in 
files' and searching for PICC18PORT since all changes are wrapped
in defines.

You are welcome to use our extra code in any way you see fit, but
I make no guarantee the port is bug free or fit for any purpose.

Note: I did not port anything to do with the USB bootloader, it
should be left disabled.

********************************************************************/

#ifndef PICC18PORT_H
#define PICC18PORT_H

// Turn on the porting code
#define PICC18PORT


#ifdef HTCPL3
#ifdef __18F14K50
extern volatile near struct {
  unsigned :1;
  unsigned TMR3IE:1;
  unsigned USBIE:1;
  unsigned BCLIE:1;
  unsigned EEIE:1;
  unsigned C2IE:1;
  unsigned C1IE:1;
  unsigned OSCFIE:1;
} PIE2bits @ ((unsigned)&PIE2);

extern volatile near struct {
  unsigned :1;
  unsigned TMR3IF:1;
  unsigned USBIF:1;
  unsigned BCLIF:1;
  unsigned EEIF:1;
  unsigned C2IF:1;
  unsigned C1IF:1;
  unsigned OSCFIF:1;
} PIR2bits @ ((unsigned)&PIR2);

extern volatile near struct {
  unsigned :1;
  unsigned SUSPND:1;
  unsigned RESUME:1;
  unsigned USBEN:1;
  unsigned PKTDIS:1;
  unsigned SE0:1;
  unsigned PPBRST:1;
} UCONbits @ ((unsigned)&UCON);

extern volatile  struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP0bits @ ((unsigned)&UEP0);

extern volatile near union {
  struct {
    unsigned BOR:1;
    unsigned POR:1;
    unsigned PD:1;
    unsigned TO:1;
    unsigned RI:1;
    unsigned :1;
    unsigned SBOREN:1;
    unsigned IPEN:1;
  };
  struct {
    unsigned NOT_BOR:1;
    unsigned NOT_POR:1;
    unsigned NOT_PD:1;
    unsigned NOT_TO:1;
    unsigned NOT_RI:1;
  };
} RCONbits @ ((unsigned)&RCON);


extern volatile near struct {
  unsigned :1;
  unsigned TMR3IP:1;
  unsigned USBIP:1;
  unsigned BCLIP:1;
  unsigned EEIP:1;
  unsigned C2IP:1;
  unsigned C1IP:1;
  unsigned OSCFIP:1;
} IPR2bits @ ((unsigned)&IPR2);


extern volatile near union {
  struct {
    unsigned RABIF:1;
    unsigned INT0F:1;
    unsigned TMR0IF:1;
    unsigned RABIE:1;
    unsigned INT0E:1;
    unsigned TMR0IE:1;
    unsigned PEIE:1;
    unsigned GIE:1;
  };
  struct {
    unsigned :1;
    unsigned INT0IF:1;
    unsigned T0IF:1;
    unsigned :1;
    unsigned INT0IE:1;
    unsigned T0IE:1;
    unsigned GIEL:1;
    unsigned GIEH:1;
  };
} INTCONbits @ ((unsigned)&INTCON);
#endif  // custom declarations for 14k50 chip
#endif

//0xF64;

#endif
