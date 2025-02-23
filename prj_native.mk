# SPDX-License-Identifier: GPL-2.0+
# Copyright (c) 2024 YOUNGJIN JOO (neoelec@gmail.com)

PRJ_NATIVE_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_NATIVE_MK_DIR	:= $(shell dirname $(PRJ_NATIVE_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

OPT			:= 0
AS_MK			:= $(MK_RACCOON_DIR)/mk/as_nasm.mk

include $(MK_RACCOON_DIR)/gcc_native.mk
