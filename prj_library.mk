PRJ_LIBRARY_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_LIBRARY_MK_DIR	:= $(shell dirname $(PRJ_LIBRARY_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

TARGET_ARCH		?= $(shell uname -m)

BINDIR			:= bin/$(TARGET_ARCH)
OBJDIR			:= obj/$(TARGET_ARCH)

CFLAGS			+= -Wextra
CFLAGS			+= -Wno-unused-parameter
CFLAGS			+= -Wno-unused-result

OPT			:= g

include $(MK_RACCOON_DIR)/gcc_library.mk
# include $(MK_RACCOON_DIR)/llvm_library.mk

prj_clean:
	rm -rf bin
	rm -rf obj

clean: prj_clean
