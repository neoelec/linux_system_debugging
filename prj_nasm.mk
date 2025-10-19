PRJ_NASM_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_NASM_MK_DIR		:= $(shell dirname $(PRJ_NASM_MK_FILE))

VPATH			+= $(PRJ_NATIVE_MK_DIR)/asm_io
EXTRAINCDIRS		+= $(PRJ_NATIVE_MK_DIR)/asm_io

CSRCS			+= asm_io_c.c asm_glue_c.c
ASRCS			+= asm_io.asm asm_glue.asm

LDFLAGS			+= -Wl,-z execstack

include $(PRJ_NASM_MK_DIR)/prj_native.mk
