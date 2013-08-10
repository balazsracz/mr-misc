# Makefile - C++ demo - Minimal demo blinks lights on the USB Starter Board
# 26Sep09 DRNadler (minor cleanup)

PREFIX=mips-sde-elf
CC=$(PREFIX)-gcc
CPP=$(PREFIX)-g++
AS=$(PREFIX)-as
AR=$(PREFIX)-ar
#LD=$(PREFIX)-ld
NM=$(PREFIX)-nm
OBJDUMP=$(PREFIX)-objdump
OBJCOPY=$(PREFIX)-objcopy

BASEDEFINES= -D__PIC32MX__ -D__C32__ -D__32MX440F256H__
CDEFINES=$(BASEDEFINES) -D__LANGUAGE_C__
ADEFINES=$(BASEDEFINES) -D__LANGUAGE_ASSEMBLY__ -fdollars-in-identifiers
# -EL - little-endian
# -g  - produce debug output
# -c  - compile only, do not link
# -O  - optimize
CFLAGS= -EL -g -c -g -msoft-float $(CDEFINES)
AFLAGS= -EL -g -c    -msoft-float $(ADEFINES)

############ Include Paths ########################################################################
# G++ AutoMagically includes d:/CSGCC/mips-sde-elf/include
# WARNING: Microchip comingled PIC junk with C-library, for example p32xxxx.h; segregated by DRN...
# Set PIC32_INCLUDES to point to directory of *only* PIC32 include files (no C language headers)
# PIC32_INCLUDES can be set via a linked resource (?)
PIC32_INCLUDES ?=d:/pic32includes2 
CIFLAGS=-I. -I$(PIC32_INCLUDES)
#CIFLAGS=-I. -Id:/pic32includes2

# G++ AutoMagically includes correct multi-lib for linking, ie:
#    d:/csgcc/bin/../lib/gcc/mips-sde-elf/4.3.2/../../../../mips-sde-elf/lib/el/sof
LIBPATHS=
LDSCRIPT=csGCC_PIC32MX_CPP_Demo.ld

# Tell make to look for source files in current directory, then Microchip subdirectory, etc.
VPATH=.:Microchip_Peripherals

all: CPP_Demo.hex 

OBJS = \
 obj/pic32mx_cfg_init.o             \
 obj/PIC32MX-reset.o                \
 obj/ISRwrapper.o                   \
                                    \
 obj/CPP_Demo.o                     \
                                    \
 obj/DRN_PIC32MX_UART1.o            \
 obj/DRN_PIC32MX_CS_glue.o          \
 obj/PIC32MX_time.o                 \
                                    \
                                    \
 obj/int_enable_interrupts_lib.o    \
 obj/int_disable_interrupts_lib.o   \
 obj/int_restore_interrupts_lib.o   \
 obj/p32mx440f256h.o                \
 obj/pcache.o                       \
# obj/osc_config_lib.o               \


# Generic Rules
obj/%.o: %.c
	$(CC)  $(CFLAGS) $(CIFLAGS) -o $@  -Wa,-a,-ad  $<  >obj/$*.lst

obj/%.o: %.cpp
	$(CPP) $(CFLAGS) $(CIFLAGS) -o $@  -Wa,-a,-ad  $<  >obj/$*.lst

obj/%.o: %.S
	$(CC)  $(AFLAGS) $(CIFLAGS) -o $@  -Wa,-a,-ad  $<  >obj/$*.lst

obj/%.o: %.s
	$(CC) $(AFLAGS) $(CIFLAGS) $< -o $@

# Special Rules
obj/p32mx440f256h.o: p32mx440f256h.S
	$(CC) $(CFLAGS)            -o obj/p32mx440f256h.o $<

depend:
	$(CC) -E -MM $(CIFLAGS) $(CDEFINES) *.c*  Microchip_Peripherals/*.c  > .depend
	$(CC) -E -MM $(CIFLAGS) $(ADEFINES) *.S   Microchip_Peripherals/*.S >> .depend
	$(CC) -E -MM $(CIFLAGS) $(ADEFINES) *.s   Microchip_Peripherals/*.s >> .depend

include .depend


CPP_Demo.hex: Makefile $(LDSCRIPT) regs.S PIC32MX-reset.S $(OBJS)
	@echo ===================  Environment  ====================
	@echo PATH="$(PATH)"
	$(CC) -v
	@echo ======================  Link  ================================
	$(CPP) -EL -msoft-float -g -Wl,-t -Wl,-Map,CPP_Demo.map -T $(LDSCRIPT) -o CPP_Demo.elf $(OBJS)
	# $(NM) -n -a CPP_Demo.elf >> CPP_Demo.map
	$(OBJDUMP) -h CPP_Demo.elf
	#$(PREFIX)-readelf --sections CPP_Demo.elf
	@echo ================  ELF LMA Adjustment  =========================
	# LD cannot handle mapping of PIC32MX logical addresses to physical.
	# Note: Physical address = LMA & 0x1FFFffff
	# Some device programmers take care of this but sadly not Microchip's...
	# Create an ELF with adjusted LMAs prior creating the HEX file.
	mips-sde-elf-objcopy --change-section-lma .PIC32MX_cfg_init-0xA0000000 --change-section-lma .boot_flash_text-0xA0000000 --change-section-lma .text-0xA0000000 --change-section-lma .eh_frame-0xA0000000 --change-section-lma .rodata-0xA0000000 --change-section-lma .data-0xA0000000 --change-section-lma .vector_4-0xA0000000 --change-section-lma .vector_24-0xA0000000 CPP_Demo.elf tmp.elf
	@echo **************************************************************
	@echo *** VERIFY NO "BF.." or "BD.." LMA in the sections below ! ***
	@echo **************************************************************
	$(OBJDUMP) -h tmp.elf
	@echo ===================  ELF to HEX  ==============================
	# Translate the ELF file into Intel hex
	$(OBJCOPY) -O ihex tmp.elf CPP_Demo.hex
	@echo Convenience Only - Non-critical parts of build follow
	# make local copy for ease of testing...
	cp CPP_Demo.hex d:/Install/USBJTAG/CPP_Demo.hex

dump:
	$(OBJDUMP) --disassemble CPP_Demo.elf

gcctst:
	$(CC) $(CFLAGS) $(CIFLAGS) -Wa,-a,-ad -o obj/tst.o tst.c >tst.lst
	
asmtst:
	$(CC) $(AFLAGS) $(CIFLAGS) -Wa,-a,-adl -o obj/tst.o tst.S >tst.lst
	
nm:
	$(NM) -n CPP_Demo.elf

clean:
	-/bin/rm -f *.o obj/* *~ CPP_Demo.elf CPP_Demo.hex CPP_Demo.map tmp.elf
