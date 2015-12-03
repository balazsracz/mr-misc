

ifeq ($(shell uname),Linux)
CC=/opt/microchip/xc8/v1.35/bin/xc8
FLASH=../flash-app/mphidflash-linux64
else
CC=/Applications/microchip/xc8/v1.35/bin/xc8
FLASH=../flash-app/mphidflash-1.6-osx-64
endif


14K50OPTS=--chip=18F14K50 --codeoffset=0x1000 --rom=1000-3FFD
OPTS= --summary=+hex,+psect --outdir=bin/ --objdir=obj/

USBSRCS= usb/usb_descriptors.c usb/usb_device.c usb/usb_function_cdc.c usb/usb_serial_lib.c
USBOPTS= -Iusb/ -Iusb/include/

USBPROD= s8-usbserial s9-usb-echo sa-usb-command


blink.hex: blink.c Makefile
	mkdir -p obj bin
	$(CC) $(OPTS) $(14K50OPTS)  $<
	cp bin/$@ $@


blflash: blink.hex
	mphidflash -w $< -r

%.hex: %.c
	mkdir -p obj bin
	$(CC) $(OPTS) $(14K50OPTS)  $<
	cp bin/$@ flash.hex

% : %.c
	mkdir -p obj bin
	$(CC) $(OPTS) $(14K50OPTS)  $<
	cp bin/$@.hex flash.hex

$(USBPROD) : % : %.c
	$(CC) $(OPTS) $(USBOPTS) $(14K50OPTS) $< $(USBSRCS)
	cp bin/$@.hex flash.hex


flash:
	mphidflash -w flash.hex -r

clean:
	rm -f bin/* obj/*
