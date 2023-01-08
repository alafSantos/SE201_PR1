PREFIX = riscv64-linux-gnu-
CC = $(PREFIX)gcc
AS = $(PREFIX)as
OBJDUMP = $(PREFIX)objdump

WARNINGS = -Wall
CFLAGS = -g -O0 -mcmodel=medlow -mabi=ilp32 -march=rv32im $(WARNINGS) -c
OBJS = se201-prog.o
EXE = main
OBJ = main.o
SOURCE = $(wildcard *.s)
C_OBJS = $(subst .c,.o,$(wildcard *.c))
$(info $C_OBJS)
.PHONY: clean

all: $(EXE)

$(EXE):$(OBJS)
	 $(LD) $(LDFLAGS) $^ -o $@

$(OBJ):$(SOURCE)
	$(AS) $^ -o $@

compile: $(C_OBJS)

%.o : %.c
	$(CC) $(CFLAGS) $^ -o $@


objdump:$(OBJS)
	 $(OBJDUMP) -d $^

clean:
	rm -f $(OBJS) $(EXE) *.o
