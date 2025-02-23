# SPDX-License-Identifier: GPL-2.0+
# Copyright (c) 2024 YOUNGJIN JOO (neoelec@gmail.com)

PRJ_LIBRARY_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_LIBRARY_MK_DIR	:= $(shell dirname $(PRJ_LIBRARY_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

OPT			:= 0

include $(MK_RACCOON_DIR)/gcc_library.mk
