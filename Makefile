PREFIX = riscv64-unknown-elf-
CC = $(PREFIX)gcc
AS = $(PREFIX)as
OBJDUMP = $(PREFIX)objdump

WARNINGS = -Wall
CFLAGS = -g -O0 -mcmodel=medlow -mabi=ilp32 -march=rv32im $(WARNINGS) -c
OBJ1 = se201-prog.o
SOURCE_C1 = se201-prog.c

OBJ2 = se201-prog-short.o
SOURCE_C2 = se201-prog-short.c

OBJ = program1.o
SOURCE = $(wildcard *.s)

.PHONY: clean

all: $(OBJ)

$(OBJ):$(SOURCE)
	$(AS) $^ -o $@

objdump:$(OBJ)
	 $(OBJDUMP) -d $^

$(OBJ1):$(SOURCE_C1)
	 $(CC) $(CFLAGS) $^ -o $@

objdump1:$(OBJ1)
	 $(OBJDUMP) -d $^

$(OBJ2):$(SOURCE_C2)
	 $(CC) $(CFLAGS) $^ -o $@

objdump2:$(OBJ2)
	 $(OBJDUMP) -d $^

clean:
	rm -f $(OBJS) $(OBJ) $(EXE)
