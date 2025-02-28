# SPDX-License-Identifier: GPL-2.0
#
# Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

ccflags-y := -D'pr_fmt(fmt)=KBUILD_MODNAME ": " fmt'
ccflags-y += -Wframe-larger-than=2048

amneziawg-y := main.o noise.o device.o peer.o timers.o queueing.o send.o receive.o socket.o peerlookup.o allowedips.o ratelimiter.o cookie.o netlink.o

ifndef WOLFCRYPT
include $(src)/crypto/Kbuild.include
endif
include $(src)/compat/Kbuild.include

obj-$(if $(KBUILD_EXTMOD),m,$(CONFIG_WIREGUARD)) := amneziawg.o

ifdef WOLFCRYPT
ifndef WOLFSSL_ROOT
WOLFSSL_ROOT = $(src)/../../../../wolfssl
endif
ccflags-y += -DUSE_WOLFCRYPT -I$(shell $(CC) -print-file-name=include) -I$(WOLFSSL_ROOT) -include $(src)/wolfcrypto_shim.h
amneziawg-y += wolfcrypto_shim.o
KBUILD_EXTRA_SYMBOLS := $(WOLFSSL_ROOT)/linuxkm/Module.symvers
endif
