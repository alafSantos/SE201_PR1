PREFIX = riscv64-linux-gnu-
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
C_OBJS = $(subst .c,.o,$(wildcard *.c))
$(info $C_OBJS)
.PHONY: clean

all: $(OBJ)

$(OBJ):$(SOURCE)
	$(AS) $^ -o $@

compile: $(C_OBJS)

%.o : %.c
	$(CC) $(CFLAGS) $^ -o $@


objdump:$(OBJS)
	 $(OBJDUMP) -d $^

$(OBJ1):$(SOURCE_C1)
	 $(CC) $(CFLAGS) $^ -o $@

$(OBJ2):$(SOURCE_C2)
	 $(CC) $(CFLAGS) $^ -o $@

objdump1:$(OBJ1)
	 $(OBJDUMP) -d $^

objdump2:$(OBJ2)
	 $(OBJDUMP) -d $^

clean:
	rm -f $(OBJS) $(OBJ) $(EXE) *.o
