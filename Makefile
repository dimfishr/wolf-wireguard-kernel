WOLFSSL_ROOT = $(src)/../../../../wolfssl
ccflags-y := -D'pr_fmt(fmt)=KBUILD_MODNAME ": " fmt'
ccflags-y += -DUSE_WOLFCRYPT -I$(shell $(CC) -print-file-name=include) -I$(WOLFSSL_ROOT) -include $(src)/wolfcrypto_shim.h
amneziawg-y := main.o
amneziawg-y += noise.o
amneziawg-y += device.o
amneziawg-y += peer.o
amneziawg-y += timers.o
amneziawg-y += queueing.o
amneziawg-y += send.o
amneziawg-y += receive.o
amneziawg-y += socket.o
amneziawg-y += peerlookup.o
amneziawg-y += allowedips.o
amneziawg-y += ratelimiter.o
amneziawg-y += cookie.o
amneziawg-y += netlink.o
amneziawg-y += wolfcrypto_shim.o
obj-m := amneziawg.o
