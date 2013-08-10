// Local definitions for hardware environment of "current project"
// By convention, expected by all Microchip-dependent source files.
// Definitions below for ILEC SN10 USB gadget on PIC32MX.
// Modification History:
//  30Aug09 DRNadler:   USB Starter Board particulars

#ifndef _HARDWARE_PROFILE_H_
#define _HARDWARE_PROFILE_H_

// diagnostic checks on environment symbols
#ifndef __PIC32MX__
    #error __PIC32MX__ MUST be defined
#endif
#ifdef __PIC24F__
    #error __PIC24F__ must NOT be defined
#endif
#ifdef __C30__
    #error __C30__ must NOT be defined
#endif

// Mysterious but required USB definition...
#define USB_A0_SILICON_WORK_AROUND

// ============ Speed Setup: System and Peripheral Clocks ============
// ****** MUST MATCH PROGRAMMED CONFIGURATION BITS AND CRYSTAL! ******
#define SYSTEM_CLOCK           60000000UL  // 60MHz CPU (typical ~50ma total)
#define PERIPHERAL_CLOCK       30000000UL

#define GetSystemClock()       SYSTEM_CLOCK
#define GetPeripheralClock()   PERIPHERAL_CLOCK

// ================ USB Starter Board particulars =================
#define USB_MAX_ALLOWED_CURRENT 200 // max current (ma) allowed for USB memory stick

#define CUSTOM_HARDWARE_INITIALIZE {                                                            \
    /* ======  Set IO pins to correct modes and safe default values ====== */                   \
    AD1PCFG = 0xFFFF;   /* Set analog pins to digital (else port B digital IO is disabled). */  \
    mPORTDSetPinsDigitalOut(BIT_0); /* Make RD0 (LED1) as output */                             \
    mPORTDClearBits(BIT_0);  /* Turn off LED1 on startup */                                     \
    mPORTDSetPinsDigitalOut(BIT_1); /* Make RD1 (LED2) as output */                             \
    mPORTDClearBits(BIT_1); /* Turn off LED2 on startup */                                      \
    OC3CON = 0; /* Disable OC3 (shared pin RD2 with LED3) */                                    \
    /* Hangs board: skip LED3 !! mPORTDSetPinsDigitalOut(BIT_2); /* Make RD2 (LED3) as output */                             \
    /*mPORTDClearBits(BIT_2); /* Turn off LED3 on startup */                                      \
}


#include "p32xxxx.h"
#include "plib.h"

#endif  // #ifndef _HARDWARE_PROFILE_H_
