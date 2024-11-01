# Define the names of the executable files
EXE = appserver
EXE2 = appserver-coarse

# Define the compiler to use
CC = cc

# List of source files
SRC= Bank.c server.c server_coarse.c

# Compiler flags: pthread for threading, Wall for all warnings, g for debugging, O3 for optimization
CFLAGS = -pthread -Wall -g -O3

# Objects are the .o files generated from the .c source files
OBJ= $(SRC:.c=.o)

# .PHONY is used to tell Make that 'all' is not a file name but a label
.PHONY : all

# Default target; depends on all objects and executables
all : $(OBJ) $(EXE) $(EXE2)

# Rule to make the first executable; depends on Bank.o and server.o
$(EXE) : Bank.o server.o
	$(CC) $(CFLAGS) $^ -o $@  # The command to create the executable from the object files

# Rule to make the second executable; depends on Bank.o and server_coarse.o
$(EXE2) : Bank.o server_coarse.o
	$(CC) $(CFLAGS) $^ -o $@  # The command to create the executable from the object files

# Pattern rule for object file generation; depends on corresponding .c source file
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@  # The command to compile source files into object files


