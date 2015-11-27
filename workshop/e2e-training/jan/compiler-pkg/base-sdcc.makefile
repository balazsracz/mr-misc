#
#  Base Makefile for SDCC projects.
#
#  Use:
#    1. Create own Makefile
#    2. Set SRCS to list of .c source files
#    3 (opt). Set PROJECT to project name
#    4 (opt). Set CFLAGS and LDFLAGS if extra flags are needed
#    5. Add "include makefile.base" line
#

# path of this file
BASE_SDCC_PATH:=$(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# these options can be overwritten
PROJECT?=project
SRCS?=
CFLAGS?=
LDFLAGS?=
DEVICE?=18f14k50
SDCC?=$(BASE_SDCC_PATH)/sdcc-pkg/bin/sdcc

# append device to CFLAGS
CFLAGS+= --use-non-free -mpic16 -p$(DEVICE)

# sanity checks
ifeq ($(strip $(SRCS)),)
$(error SRCS is empty)
endif

ifneq ($(strip $(SRCS:%.c=)),)
$(error SRCS contains files without .c extension)
endif

# all rule
.PHONY: all
all: $(PROJECT).hex

# rules for building .dep dependeny maps and .o objects from .c files
OBJS=$(SRCS:%.c=%.o)
DEPS=$(SRCS:%.c=%.dep)

%.o: %.c
	$(SDCC) $(CFLAGS) -c $< -o $@

%.dep: %.c
	$(SDCC) $(CFLAGS) $< -M > $@

# include generated dependencies
-include $(DEPS)

# rules for building project binaries
$(PROJECT).hex: $(OBJS) $(DEPS)
	$(SDCC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@

# clean rule
.PHONY: clean
clean:
	rm -f -- $(DEPS) $(OBJS) \
		$(SRCS:%.c=%.asm) $(SRCS:%.c=%.lst) $(SRCS:%.c=%.sym) $(SRCS:%.c=%.rel) $(SRCS=%.c=%.o) \
		$(PROJECT).hex $(PROJECT).cod $(PROJECT).lst
