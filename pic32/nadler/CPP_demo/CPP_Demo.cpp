/*
** Minimal C++ Example to run on Microchip USB Starter Board:
** - blinks LEDs
** - outputs minimal diagnostic on UART1 (no RS232 hardware on this board)
**
**
** Copyright (c) 2009 Dave Nadler
**
** The authors hereby grant permission to use, copy, modify, distribute,
** and license this software and its documentation for any purpose, provided
** that existing copyright notices are retained in all copies and that this
** notice is included verbatim in any distributions.  No written agreement,
** license, or royalty fee is required for any of the authorized uses.
** Modifications to this software may be copyrighted by their authors
** and need not follow the licensing terms described here, provided that
** the new terms are clearly indicated on the first page of each file where
** they apply.
**
** History:
**   8Aug09 DRNadler: Initial Coding.
*/

#include <string.h>  // memcmp
#include <time.h>
#include <stdio.h>   // printf

extern "C" {
  #include "HardwareProfile.h"
  #include "plib.h"
};

#include "PIC32MX_time.h"	// DRN time routines

int i;
const char *hello = "Hi there debugger";

int main ( void )
{
    // Configure the device for maximum performance but do not change PBDIV
    // Set the flash wait states, RAM wait state and enable prefetch cache,
    // but do NOT change PBDIV.
    // PBDIV is set from the configuration bytes during device reset.
    SYSTEMConfig(GetSystemClock(), SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    // Enable the cache for the best performance (assuming we're running in KSEG0)
    CheKseg0CacheOn();

    //mJTAGPortEnable(DEBUG_JTAGPORT_OFF);

    CUSTOM_HARDWARE_INITIALIZE;

    INTEnableInterrupts();

    // Set clock (newlib-accessible, unix emulation) to 15-July-2009
    SetSystemTime( (int)((39*365+205)*24*60*60) );
    time_t t =  time(0);
    //printf("Time = %s\n",ctime(&t));

    mPORTBSetPinsDigitalOut( BIT_12 | BIT_15 );
    mPORTBToggleBits(BIT_12  );

    //mPORTDSetBits(BIT_1);   // Setup USB starter board: LED1  ON
    C_ElapsedTime demoTimer;
    while(1) {
        if( ! demoTimer.millisecondsHaveElapsed(100)) continue;
        demoTimer.reset();
        mPORTBToggleBits(BIT_12 | BIT_15  );
        C_ElapsedTime demoTimer2;
        demoTimer2.waitMsec(300);
    };
    return 0;

} // main
