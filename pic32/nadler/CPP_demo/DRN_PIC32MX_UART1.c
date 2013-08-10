/* DRN_PIC32MX_UART1.c  -  PIC32MX UART1 I/O
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
**   5Jul09 DRNadler:   Consistent initialization, de-initialize
**  13Jun09 DRNadler:   Segregated from newlib redirection code, add
**                      functions to support serial_PIC32 class
**  11May09 DRNadler:   Initial Coding
*/

// #include <stdio.h>      // printf (diagnostic use only)

#include "HardwareProfile.h" // low-level peripherals plus configured speeds
#include "DRN_PIC32MX_UART1.h" // interface specification for this module

static int UART1_initialized = 0;

static void UART1_init(void) {
    UART1_initialized = 1;

    // Set up UART1 (used for SN10 software load, and for now diagnostics)
    OpenUART1(
        // config1: UxMODE register parameters
        UART_EN                 | /* Module enable */
        UART_IDLE_CON           | /* Work in IDLE (sleep) mode */
        UART_IRDA_DIS           | /* IRDA encoder and decoder disable */
        // UART_MODE_SIMPLEX       | /* no flow control */
        UART_RX_TX              | /* Communication through the normal pins */
        UART_DIS_BCLK_CTS_RTS   | /* Disable BCLKx, CTS, and RTS pins */
        // UART_EN_WAKE            | /* useful for NSP only ! Enable Wake-up on START bit Detect during SLEEP Mode bit */
        UART_DIS_WAKE           | /* Disable Wake-up on START bit Detect during SLEEP Mode bit */
        UART_DIS_LOOPBACK       | /* Loop back disabled */
        UART_DIS_ABAUD          | /* No auto-baud (Input to Capture module from ICx pin) */
        UART_NO_PAR_8BIT        | /* no parity, 8 bit data */
        UART_NORMAL_RX          | /* UxRX idle state is '1' */
        UART_BRGH_SIXTEEN       | /* 16x baud clock divisor - Normal speed */
        UART_1STOPBIT           | /* May not receive from AM186ES with 2 stop bits specified, so use 1... */
        0,
        // config2: UxSTA register parameters
        UART_INT_TX             | /* Interrupt when at least one space available in buffer */
        UART_RX_ENABLE          | /* Enable receiver pin */
        UART_TX_ENABLE          | /* Enable transmitter pin */
        UART_INT_RX_CHAR        | /* Interrupt on every char received */
        0,
        // baud rate divisor:
        (int)(((PERIPHERAL_CLOCK/(16UL*19200UL)))-1)
        );
    IPC6bits.U1IP = 3; // arbitrary priority (reserve max priority 7 for USB)
    IPC6bits.U1IS = 0; // ignore subpriority...
    IEC0bits.U1RXIE = 1;  // enable the receive interrupt
}

// ==========================================================================
// =======================  UART1 ISR data structures  ======================
// ==========================================================================

static unsigned char TxBuffer[200]; // ring buffer
static unsigned char volatile *TxNextTx    = &TxBuffer[0]; // address of next data to send
static unsigned char          *TxNextInsert= &TxBuffer[0]; // equal to above when no more data to send
static unsigned char RxBuffer[200]; // ring buffer
static unsigned char volatile *RxNextRx    = &RxBuffer[0]; // address for next data received
static unsigned char          *RxNextRead  = &RxBuffer[0]; // equal to above when no more data to read from buffer
// ring buffer pointer-increment with wrap-around...
#define INCR_PTR(_ptr,_buf)  \
    { if(++_ptr > &_buf[sizeof(_buf)-1]) _ptr = &_buf[0]; }

// Output a character to UART1 (actually, enqueue in output buffer).
// If the output buffer is full, block until there's space to enqueue
// this character.
void __DRN_putc(char c) {
    if( ! UART1_initialized) UART1_init();
    // Copy one character to output buffer
    unsigned char *TxP2 = TxNextInsert;
    *TxNextInsert = c;
    INCR_PTR(TxP2, TxBuffer); // when required, wraps around to ring-buffer start
    while(TxP2 == TxNextTx) {}; // WAIT FOR BUFFER TO BE NON-FULL
    // Atomically update ptr to next TX buffer insert point
    //... disable();
    TxNextInsert = TxP2; // store is atomic on MIPS...
    //... if(interruptsWereEnabled) enable();
    IEC0bits.U1TXIE = 1;  // enable the transmit interrupt; ISR will do the heavy lifting
    IFS0bits.U1TXIF = 1;  // jam interrupt-request bit to force TX interrupt (works, by experiment)
}
// Read a character from UART1 (via input buffer)
// Return -1 if no data available (non-blocking)
int __DRN_getc(void) {
    if( ! UART1_initialized) UART1_init();
    if(RxNextRx == RxNextRead) return -1;
    unsigned char c = *RxNextRead;
    INCR_PTR(RxNextRead, RxBuffer); // when required, wraps around to ring-buffer start
    return (int)c;
}

// Technically, should add number of characters in the transmit FIFO (up to 4)
int __DRN_UART1_outputBytesQueued(void) {
    if( ! UART1_initialized) UART1_init();
    int delta = TxNextInsert-TxNextTx;
    if(delta >= 0) return delta;
    // pointers are straddling ring-buffer wrap-around
    return sizeof(TxBuffer)+delta;
};
int __DRN_UART1_inputBytesQueued(void) {
    if( ! UART1_initialized) UART1_init();
    int delta = RxNextRx-RxNextRead;
    if(delta >= 0) return delta;
    // pointers are straddling ring-buffer wrap-around
    return sizeof(RxBuffer)+delta;
};
// Clear any input and reset port speed
void __DRN_UART1_setBaud(int baud) {
    if( ! UART1_initialized) UART1_init();
    // presumes 16x baud clock divisor as set above...
    U1BRG = (int)(((PERIPHERAL_CLOCK/(16UL*baud)))-1);
    __DRN_UART1_flushRx();
};
// Clear any input
void __DRN_UART1_flushRx(void) {
    RxNextRx = RxNextRead  = &RxBuffer[0];
};
// Disable UART and especially interrupts
void __DRN_UART1_disable(void) {
	// disable receive and transmit interrupts
    IEC0bits.U1RXIE = 0;
    IEC0bits.U1TXIE = 0;
};



// UART1 ISR - serial port 1
void c_vector_24_ISR(void) {
    // Clear any receive errors (overflow, parity, framing)
    if(U1STA & (USTA_OERR | USTA_FERR | USTA_PERR) ) {
        /* DEBUG: ... insert X in receive buffer */
        // Documentation says: Reset overflow bit (which flushes receive FIFO)
        // Quote: "To keep the data received prior to the overrun, the user should
        // first read all five characters, then clear the OERR bit. If the five
        // characters can be discarded, the user can simply clear the OERR bit.
        // This effectively resets the receive FIFO, and all prior received data is lost".
        U1STACLR = USTA_OERR |
                   USTA_FERR |
                   USTA_PERR ;
        // *********************** HARDWARE BUG ***********************
        // Unfortunately, **SOMETIMES** this doesn't really reset UART;
        // What sometimes happens: RXDA remains on and the receive buffer overflows.
        // NSP driver example: USTA = 0x01091533:
        // - RXDA (x1)
        // - overrun (x2)
        // - no framing error (x4)
        // RXDA sticks set (and will cause a receive buffer overflow).
        // Experimentally determined kludge definitely resets UART...
        if( (U1STA & (USTA_OERR | USTA_FERR | USTA_PERR)) ||
                U1STAbits.URXDA                                  )
        {
                int kludgeCnt;
                for(kludgeCnt=5; kludgeCnt; kludgeCnt--) {
                        // clear overflow, parity, and framing error bits
                        U1STACLR = USTA_OERR |
                                   USTA_FERR |
                                   USTA_PERR ;
                        // read dummy characters to "unstick" UART
                        int junk1 = U1RXREG;
                        int junk2 = U1RXREG;
                        int junk3 = U1RXREG;
                        int junk4 = U1RXREG;
                };
        }
    }
    // Receive data into buffer...
    {   // Prevent infinite loop if RX data available doesn't clear
        // (as it does NOT clear on some error conditions). There cannot
        // be more than 5 characters pending (FIFO=4 + shift register)...
        IFS0CLR = _IFS0_U1RXIF_MASK; // first, reset interrupt request
        int rxlimit;
        for(rxlimit=5; rxlimit && U1STAbits.URXDA; rxlimit--) {
            char d = U1RXREG;
            *RxNextRx = d;
            // advance buffer pointer unless it would cause an overflow
            unsigned char volatile *next_RxNextRx = RxNextRx;
            INCR_PTR(next_RxNextRx, RxBuffer);
            if(next_RxNextRx != RxNextRead) RxNextRx = next_RxNextRx;
        }
    }
    // If there's space in transmit buffer, send any pending output
    if(! U1STAbits.UTXBF) {
        IFS0CLR = _IFS0_U1TXIF_MASK;
        if( TxNextTx != TxNextInsert) {
            // send out a character
            U1TXREG = *TxNextTx; // enqueue character into UART's transmit FIFO...
            INCR_PTR(TxNextTx, TxBuffer);
        } else {
            // no data waiting to be sent; disable interrupt to avoid continuous infinite interrupts here
            IEC0bits.U1TXIE = 0;
        }
    }
        IFS0CLR = _IFS0_U1EIF_MASK; // clear error requests (ISR must reset all request flags prior exit)
}

// override Microchip library routine, just in case it gets used...
void putsUART1(const /*unsigned*/ char *string) {
    char c;
    while( c = *string++ ) __DRN_putc(c);
}
