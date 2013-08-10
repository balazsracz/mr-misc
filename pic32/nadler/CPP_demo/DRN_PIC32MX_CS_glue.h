/* DRN_PIC32MX_CS_glue.h  -  PIC32MX environment glue
**
** Declare routines you must provide to use DRN_PIC32MX_CS_glue.h
** (Maps "gets" and "printf" to read and write via UART1)
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
** Modification History:
**  11May09 DRNadler:   Initial Coding
*/

// Utilities you must be provide to connect to file system (or provide no-ops)
extern int DRN_f_write(int file, char *ptr, int len);
extern int DRN_f_read(int file, char *ptr, int len);

// Redirect stdout/stderr to file, then resume normal operation
extern void DRN_std_redirect(const char* filename);
extern void DRN_std_unredirect(void);

#ifdef __cplusplus
  // wrapper class for std IO redirector ensures redirect is exited...
  class C_STD_IO_redirect {
    public:
      C_STD_IO_redirect(const char* filename) { DRN_std_redirect(filename); };
      ~C_STD_IO_redirect()                    { DRN_std_unredirect();       };
  };
#endif
