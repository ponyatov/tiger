TARGET  = i686-linux-gnu
QEMU    = qemu-system-i386
TCC     = $(TARGET)-g++
TSIZE   = $(TARGET)-size
TOD     = $(TARGET)-objdump
TFLAGS += -m32 -no-pie
