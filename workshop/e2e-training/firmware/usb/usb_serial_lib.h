#ifndef _USB_SERIAL_LIB_H
#define _USB_SERIAL_LIB_H

#include "picc18port.h"

#include "GenericTypeDefs.h"
#include "Compiler.h"

#include "USB/usb.h"
#include "USB/usb_function_cdc.h"
#include "USB/usb_device.h"

//#include "HardwareProfile - Low Pin Count USB Development Kit.h"


void InitializeUSBSystem(void);
void USBDeviceTasks(void);  // To be called from ISR.

#endif //_USB_SERIAL_LIB_H
