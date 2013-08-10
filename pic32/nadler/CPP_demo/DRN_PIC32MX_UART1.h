/* DRN_PIC32MX_UART1.h  -  PIC32MX UART1 I/O
**
** UART1 I/O via ISR and local buffer.
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
**   5Jul09 DRNadler:   Add __DRN_UART1_disable.
**  12Jun09 DRNadler:   Segregated from newlib redirection code, add
**                      functions to support serial_PIC32 class
**  11May09 DRNadler:   Initial Coding
*/

// Output a character to UART1 (actually, enqueue in output buffer).
// If the output buffer is full, block until there's space to enqueue
// this character.
extern void __DRN_putc(char c);

// Read a character from UART1 (via input buffer)
// Return -1 if no data available (non-blocking)
extern int __DRN_getc(void);

// Return number of bytes enqueued for transmission
extern int __DRN_UART1_outputBytesQueued(void);

// Return number of bytes enqueued ready for the application
extern int __DRN_UART1_inputBytesQueued(void);

// Clear any input and reset port speed
extern void __DRN_UART1_setBaud(int baud);

// Clear any input
extern void __DRN_UART1_flushRx(void);

// Disable UART and especially interrupts
extern void __DRN_UART1_disable(void);

