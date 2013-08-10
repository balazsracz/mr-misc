// PIC32MX_time.cpp - Simulated realtime clock, timer support
//
// Provides:
// - one-millisecond timer resolution
// - POSIX-style "time" (second resolution)
//
// Copyright (c) 2009 Dave Nadler
//
// The authors hereby grant permission to use, copy, modify, distribute,
// and license this software and its documentation for any purpose, provided
// that existing copyright notices are retained in all copies and that this
// notice is included verbatim in any distributions.  No written agreement,
// license, or royalty fee is required for any of the authorized uses.
// Modifications to this software may be copyrighted by their authors
// and need not follow the licensing terms described here, provided that
// the new terms are clearly indicated on the first page of each file where
// they apply.
//
// Modification History:
//   29Aug09 DRNadler:  Set default date to 15-July-2009
//   18Aug09 DRNadler:  Add Timer2 support
//   13Jun09 DRNadler:  Initial Coding
//
// PIC32MX has a counter/timer in the CPU  core ("CoreTimer"), plus a
// set of "general purpose" peripheral counter/timers.
//
// CoreTimer: 32-bit, incremented every other CPU clock cycle, with
// interrupt generated on match to a compare register. Counter does not
// reset automatically on compare match; not good for timebase !
//
// Peripheral Timer Type A:
// - works during CPU SLEEP (well, only with external clock, not
//   applicable in this application) - and CPU IDLE (applicable)
// - 16-bit only
// - PBclk source possible, max 256:1 prescale, 30,000,000UL/256...
// - reset to zero on match to "period" register
//
// Code here uses peripheral Timer1 or Timer2
#define USE_TIMER1

#include <time.h> // time_t
#include "HardwareProfile.h"

static bool timer_initialized = false;
static volatile time_t posixTime = (39*365+205)*24*60*60; // Default date is 15-July-2009
static volatile int milliseconds = 0; // since system start

static void timer_init(void) {
    if(timer_initialized) return;
    timer_initialized = true;
  #ifdef USE_TIMER1
    T1CON = T1_OFF          |   // timer OFF until setup complete
            T1_IDLE_CON     |   // continue counting in CPU IDLE state
            T1_PS_1_8       |   // pre-scale clock-divisor 8:1
            T1_SYNC_EXT_OFF |   // no external clock synchronization
            T1_SOURCE_INT   |   // clock source is internal PBclock
            0;
    TMR1 = 0;
    // period for 1-millisecond interrupts (1000 interrupts/sec)
    PR1 = (int)( (PERIPHERAL_CLOCK/8 /*prescale*/) / 1000); // 3750.00 for 30MHz PBclk
    IPC1bits.T1IP = 3; // 1 is lowest interrupt priority
    IEC0bits.T1IE = 1; // enable timer1 interrupt
    T1CONSET = T1_ON;
  #else
    T2CON = T2_OFF          |   // timer OFF until setup complete
            T2_IDLE_CON     |   // continue counting in CPU IDLE state
            T2_PS_1_8       |   // pre-scale clock-divisor 8:1
            T2_SOURCE_INT   |   // clock source is internal PBclock
            0;
    TMR2 = 0;
    // period for 1-millisecond interrupts (1000 interrupts/sec)
    PR2 = (int)( (PERIPHERAL_CLOCK/8 /*prescale*/) / 1000); // 3750.00 for 30MHz PBclk
    IPC2bits.T2IP = 3; // 1 is lowest interrupt priority
    IEC0bits.T2IE = 1; // enable timer1 interrupt
    T2CONSET = T2_ON;
  #endif
};

extern "C" void
  #ifdef USE_TIMER1
     c_vector_4_ISR(void)
  #else
     c_vector_8_ISR(void)
  #endif
{
    milliseconds++;
    static int msSinceSeconds = 0;
    if(++msSinceSeconds>=1000) {
        msSinceSeconds = 0;
        posixTime++;
    };
  #ifdef USE_TIMER1
    IFS0CLR = _IFS0_T1IF_MASK; // clear interrupt request as required prior ISR exit
  #else
    IFS0CLR = _IFS0_T2IF_MASK; // clear interrupt request as required prior ISR exit
  #endif
};

// Set POSIX time, which will count forward from this value
extern "C" void SetSystemTime(time_t t) {
    timer_init();
    posixTime = t;
};
// Get milliseconds since timer started
extern "C" int systemMilliseconds(void) { timer_init(); return milliseconds; };

// Emulate system call "time"
extern "C" time_t time(time_t *pt) {
    timer_init();
    if(pt) *pt = posixTime;
    return posixTime;
}

#if 0 // Can't find documentation for "times" call...
  // as required for newlib - or maybe not, seems AOK without this.
  extern "C" int times(struct tms *buf) {
    timer_init();
    return -1;
  }
#endif
