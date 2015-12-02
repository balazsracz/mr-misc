

CC=/opt/microchip/xc8/v1.35/bin/xc8

14K50OPTS=--chip=18F14K50 --codeoffset=0x1000 --rom=1000-3FFD
OPTS= --summary=+hex,+psect --outdir=bin/ --objdir=obj/

USBSRCS= usb/usb_descriptors.c usb/usb_device.c usb/usb_function_cdc.c usb/usb_serial_lib.c
USBOPTS= -Iusb/ -Iusb/include/


blink.hex: blink.c Makefile
	mkdir -p obj bin
	$(CC) $(OPTS) $(14K50OPTS)  $<
	cp bin/$@ $@


blflash: blink.hex
	mphidflash -w $< -r

clean:
	rm -f bin/* obj/*
