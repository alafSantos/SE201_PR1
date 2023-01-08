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

C_OBJS = $(subst .c,.o,$(wildcard *.c))

CLEAN = $(OBJ) $(OBJ1) $(OBJ2) 

.PHONY: clean

all: $(OBJ)

compile: $(C_OBJS)

%.o : %.c
	$(CC) $(CFLAGS) $^ -o $@

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
	rm -f $(CLEAN) *.o

info:
	@echo "\t\t----COMMAND LIST-----"
	@echo "\n\tmake program1.o: generates the program1.o file"
	@echo "\n\tmake objdump: shows the assembly related to the file program1.o"
	@echo "\n\tmake se201-prog.o: generates the se201-prog.o file"
	@echo "\n\tmake objdump1: shows the assembly related to the file se201-prog.o"
	@echo "\n\tmake se201-prog-short.o: generates the se201-prog-short.o file"
	@echo "\n\tmake objdump2: shows the assembly related to the file se201-prog-short.o"
	@echo "\n\tmake clean: cleans up the created object files"
	@echo "\n\tmake info: shows this command list"
