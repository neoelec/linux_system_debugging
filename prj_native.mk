PRJ_NATIVE_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_NATIVE_MK_DIR	:= $(shell dirname $(PRJ_NATIVE_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

VPATH			+= $(PRJ_NATIVE_MK_DIR)/src_c
EXTRAINCDIRS		+= $(PRJ_NATIVE_MK_DIR)/inc

HOSTYPE			:= $(shell uname -m)

BINDIR			:= bin/$(HOSTYPE)
OBJDIR			:= obj/$(HOSTYPE)

CFLAGS			+= -DHOSTTYPE=$(HOSTYPE)
CFLAGS			+= -Wextra
CFLAGS			+= -Wno-unused-parameter
CFLAGS			+= -Wno-unused-result

OPT			:= g

include $(MK_RACCOON_DIR)/gcc_native.mk
# include $(MK_RACCOON_DIR)/llvm_native.mk

prj_clean:
	rm -rf bin
	rm -rf obj

clean: prj_clean
