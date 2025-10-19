PRJ_NATIVE_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_NATIVE_MK_DIR	:= $(shell dirname $(PRJ_NATIVE_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

CFLAGS			+= -Wextra
CFLAGS			+= -Wno-unused-parameter
CFLAGS			+= -Wno-unused-result
CFLAGS			+= -fsanitize=undefined
CFLAGS			+= -fno-sanitize-recover=all

LDFLAGS			+= -lubsan

OPT			:= g

AS_MK			:= $(MK_RACCOON_DIR)/mk/as_nasm.mk

include $(MK_RACCOON_DIR)/gcc_native.mk
# include $(MK_RACCOON_DIR)/llvm_native.mk
