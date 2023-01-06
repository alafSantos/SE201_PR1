PREFIX = riscv64-unknown-elf-
CC = $(PREFIX)gcc
AS = $(PREFIX)as
OBJDUMP = $(PREFIX)objdump

WARNINGS = -Wall
CFLAGS = -g -O0 -mcmodel=medlow -mabi=ilp32 -march=rv32im $(WARNINGS) -c
OBJS = se201-prog.o
EXE = main
OBJ = main.o
SOURCE = $(wildcard *.s)

.PHONY: clean

all: $(EXE)

$(EXE):$(OBJS)
	 $(LD) $(LDFLAGS) $^ -o $@

$(OBJ):$(SOURCE)
	$(AS) $^ -o $@

objdump:$(OBJ)
	 $(OBJDUMP) -d $^

clean:
	rm -f $(OBJS) $(EXE)
