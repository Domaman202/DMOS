CC=clang
CFLAGS=-m32 -Wall -g -O0 -S -emit-llvm
AFLAGS=-m32
LDFLAGS=-m32 -ffreestanding -nostdlib -g -T link.ld -lgcc

OUT_DIR = ../bin
EXECUTABLE=../isodir/kernel.elf

SOURCES_C=$(wildcard *.c)
SOURCES_S=$(wildcard *.S)

OBJECTS_C=${OUT_DIR}/$(SOURCES_C:.c=.ll)
OBJECTS_S=${OUT_DIR}/$(SOURCES_S:.S=.o)


.PHONY: all


all: $(OBJECTS_C) $(OBJECTS_S)  $(EXECUTABLE)


$(OBJECTS_C): $(SOURCES_C)
	$(CC) $(CFLAGS)   -c -o $@ $<


$(OBJECTS_S): $(SOURCES_S)
	$(CC) $(AFLAGS) -c -o $@ $<


$(EXECUTABLE): $(SOURCES_S)  $(SOURCES_C)
	$(CC) $(LDFLAGS) $(OBJECTS_S) $(OBJECTS_C) -o $@
