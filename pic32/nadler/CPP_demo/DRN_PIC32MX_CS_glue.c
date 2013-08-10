/* DRN_PIC32MX_CS_glue.c  -  PIC32MX newlib environment glue
**
** Map newlib read and write to UART1 and/or local FAT file system
**
** Provides minimal stubs for OS functions "read" and "write"
** Works for newlib or any runtime library that sends IO for file descriptors
** stdin/stdout to "read" and "write".
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
** Modification History:
**  29Aug09 DRNadler:   Bugfix: prevent recursion in DRN_std_unredirect
**  15Jul09 DRNadler:   No-op's for when no file system is available
**  12Jun09 DRNadler:   Split UART1 code into DRN_PIC32MX_UART1.*
**  11May09 DRNadler:   Initial Coding
*/

// #include <unistd.h>     // OS read/write, as required by newlib and provided below
#include <fcntl.h> // flags for 'open'

#include "HardwareProfile.h"   // low-level peripherals plus configured speeds
#include "DRN_PIC32MX_UART1.h" // getc/putc etc.

#if 1
    // no-op routines/macros for when no file system exists
    //int DRN_f_write(int file, char *ptr, int len) { return len; };
    //int DRN_f_read(int file, char *ptr, int len) { return 0; };
    #define DRN_f_write(file, ptr, len) (len)
    #define DRN_f_read(file, ptr, len) (0)
#endif

#if 0
  // Test printf (works OK)...
  void test_printf(void) {
    static const unsigned char ExampleName[] = "123456789ABC";
    printf("\n\n====  DRN tests for printf functionality  ====\n");
    printf("The answer is %d\nABC\n",43);
    printf("Test String11 output '%-11.11s'\n", ExampleName);
    printf("Test hex output >>%3x<<  >>%05X<<\n", 0x123, 0x123);
  }
#endif

// ======================  STDOUT redirect ===============================
// Redirect stdout/stderr to file, then resume normal operation
// Redirecting stdout and stderr permits normal "printf" use
// while serial port is otherwise busy...
static int stdout_redirected = 0;
static int redirect_file = 0;
void DRN_std_redirect(const char* filename) {
    redirect_file = open(filename, O_WRONLY /* Windows only: | O_TEXT */);
    stdout_redirected = 1;
}
void DRN_std_unredirect(void) {
    stdout_redirected = 0; // *BEFORE* calling close, so diag printfs within close don't blow up...
    if(redirect_file>0) close(redirect_file);
    redirect_file = 0;
}

// =================== newlib connections to FAT etc ================
// Low-level Unix IO IO functions called by newlib
int write(int file, char *ptr, int len) {
    // For stdin, stdout, or stderr, send output to UART1 (or to redirect file)
    if(file==0 || file==1 || file==2) {
        if(stdout_redirected) {
            if(redirect_file>0)
                return write(redirect_file,ptr,len);
            else
                return len; // redirect file open failed; output is ignored...
        } else {
            int todo;
            for (todo = len; todo; todo--) {
                char c = *ptr++;
                if(c=='\n') { __DRN_putc('\r'); __DRN_putc('\n'); }
                else        { __DRN_putc(c);                      }
            }
            return len;
        }
    }
    // map file IO to DRN stubs, defined in application...
    return DRN_f_write(file,ptr,len);
}
int read(int file, char *ptr, int len) {
    // For stdin (called by gets etc), stdout, or stderr, read from UART1
    if(file==0 || file==1 || file==2) {
        // printf("read(file=%d,*,len=%d... ",file,len);
        int ic;
        while( (ic=__DRN_getc()) == -1) {}; // block until a character typed
        if(ic == 0x0D) ic = 0x0A; // map "Return" on terminal to newline
        *ptr = (char)ic;
        // printf(" %02x\n",ic);
        return 1;
    }
    // map file IO to DRN stubs, defined in application...
    return DRN_f_read(file, ptr, len);
}
