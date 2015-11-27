
CSRCS= main.c BootPIC18NonJ.c usb_descriptors.c  usb_device.c  usb_device_hid.c
ASRCS= VectorRemap.asm

BC_AS=$(word 1,$(patsubst %.c,obj/%.as,$(notdir $(CSRCS))))
BC_ASM=$(word 1,$(patsubst %.c,obj/%.asm,$(notdir $(CSRCS))))
BC_P1=$(patsubst %.c,obj/%.p1,$(notdir $(CSRCS)))


XCBUILD=1

ifdef XCBUILD
CC=/opt/microchip/xc8/v1.35/bin/xc8
OPTS+= --addrqual=require  --cci
BUILD=/home/bracz/prg/hitech/picc-18/pro/9.66/bin/picc18
else
CC=/home/bracz/prg/hitech/picc-18/pro/9.66/bin/picc18
OPTS+= -D__XC8__ -D__XC__ -I.
endif

OPTS+= --chip=18F14K50 --mode=pro  -P --summary=+psect,+hex --rom=0-13FF
DIROPTS= --outdir=bin/ --objdir=obj/


-include *.d

clean:
	rm -f *.d *.p1 *.pre *.obj *.hxl *.cof *.cmf startup.* main.hex main.as
	rm -f obj/* bin/*

hex: $(CSRCS) $(ASRCS)
	$(CC) $(OPTS) $(DIROPTS) $+


obj/%.p1: %.c
	$(CC) $(OPTS) --pass1 -o$@ $< #$(filter-out $^,$(CSRCS))

obj/%.as: $(BC_P1)
	$(CC) $(OPTS) --asmlist -O$@ -S $(BC_P1) 
#	$(BUILD) --chip=18F14K50 --mode=pro  -P -O$@ -S $(BC_P1) 

obj/%.asm: obj/%.as assanitize.awk
	./assanitize.awk -v V963=$(SAN963) $< $< > $@

dhex: $(BC_AS)
	+echo AS=$(BC_AS)
	+echo ASM=$(BC_ASM)
	+echo P1=$(BC_P1)
	$(CC) $(OPTS) --objdir=obj/ --outdir=bin/ -O$@.hex $^ $(ASRCS)


# "/opt/microchip/xc8/v1.35/bin/xc8" -C  --chip=18F14K50 -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-1800-3FFF --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=require --mode=pro -P -N255 --warn=0 --cci --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,+keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf "--errformat=%f:%l: error: %s" "--warnformat=%f:%l: warning: %s" "--msgformat=%f:%l: advisory: %s"  -obuild/PIC18F14K50_XC8/production/_ext/1360937237/VectorRemap.obj  ../src/VectorRemap.asm 
