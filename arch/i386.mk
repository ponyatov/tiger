TARGET  = i686-linux-gnu
QEMU    = qemu-system-i386
TCC     = $(TARGET)-g++
TSIZE   = $(TARGET)-size
TOD     = $(TARGET)-objdump
TFLAGS += -march=$(ARCH)

TC += $(wildcard src/libc/*.c*)
TH += $(wildcard src/libc/*.h*)
