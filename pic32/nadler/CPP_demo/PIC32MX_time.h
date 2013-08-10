// PIC32MX_time.h - Simulated realtime clock, timer support
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
//   28Aug09 DRNadler:  Add millisecondsHaveElapsed
//   13Jun09 DRNadler:  Initial Coding

#ifdef __cplusplus
  extern "C" {
#endif

// set POSIX time, which will count forward from this value
void SetSystemTime(time_t t);
// get milliseconds since timer started
int systemMilliseconds(void);

#ifdef __cplusplus
  }; /* end of extern "C" */
#endif

#ifdef __cplusplus
  // delay manager class
  class C_ElapsedTime {
    private:
      int start_milliseconds;
    public:
      C_ElapsedTime() { reset(); /* Note the start time */ };
      void reset() { start_milliseconds = systemMilliseconds(); };
      int elapsed_seconds() {
          return (systemMilliseconds()-start_milliseconds)/1000;
      };
      bool millisecondsHaveElapsed(int n) {
          return ((systemMilliseconds()-start_milliseconds) > n);
      };
      void waitMsec(int delay) {
          while( (systemMilliseconds()-start_milliseconds) < delay ) {};
      };
  };
#endif
