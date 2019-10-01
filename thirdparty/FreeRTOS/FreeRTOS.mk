#
# Copyright 2019 SiFive, Inc #
# SPDX-License-Identifier: Apache-2.0 #
#

TMPVAR=$(abspath $(dir $(lastword ${MAKEFILE_LIST})))/FreeRTOS-Kernel
FREERTOS_DIR := $(shell realpath --relative-to . $(TMPVAR))
$(info FREERTOS_DIR=${FREERTOS_DIR})

FREERTOS_MEMMANG_DIR =${FREERTOS_DIR}/portable/MemMang

FREERTOS_INCLUDES := -I${FREERTOS_DIR}/include
FREERTOS_INCLUDES += -I${FREERTOS_DIR}/portable/MemMang
FREERTOS_INCLUDES += -I${FREERTOS_DIR}/portable/GCC/RISC-V
FREERTOS_INCLUDES += -I${FREERTOS_DIR}/portable/GCC/RISC-V/chip_specific_extensions/RV32I_CLINT_no_extensions

FREERTOS_C_SOURCES = croutine.c
FREERTOS_C_SOURCES += event_groups.c
FREERTOS_C_SOURCES += list.c
FREERTOS_C_SOURCES += queue.c
FREERTOS_C_SOURCES += stream_buffer.c
FREERTOS_C_SOURCES += tasks.c
FREERTOS_C_SOURCES += timers.c

FREERTOS_HEAP_1_C		= heap_1.c
FREERTOS_HEAP_2_C		= heap_2.c
FREERTOS_HEAP_3_C		= heap_3.c
FREERTOS_HEAP_4_C		= heap_4.c
FREERTOS_HEAP_5_C		= heap_5.c

VPATH:=${FREERTOS_DIR}:${FREERTOS_DIR}/portable/MemMang:${FREERTOS_DIR}/portable/GCC/RISC-V:${VPATH}
