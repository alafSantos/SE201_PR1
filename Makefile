PREFIX = riscv64-unknown-elf-
CC = $(PREFIX)gcc
WARNINGS = -Wall
CFLAGS = -g -O0 -mcmodel=medlow -mabi=ilp32 -march=rv32im $(WARNINGS) -c
OBJS = se201-prog.o
EXE = main

.PHONY: clean

all: $(EXE)

$(EXE):$(OBJS)
	 $(LD) $(LDFLAGS) $^ -o $@

clean:
	rm -f $(OBJS) $(EXE)
