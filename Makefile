# The compiler to use
CC = gcc
CF = gfortran
# Compiler flags: -g for debugging, -Wall for all warnings
CFLAGS = -O2 -Wall
FFLAGS = -O2

# The name of your final program
TARGET = main
FTARGET	=	need
all: $(TARGET)
$(TARGET): $(TARGET).c
	$(CF) $(FFLAGS) -c $(FTARGET).f90
	$(CF) $(FFLAGS) $(TARGET).c $(FTARGET).o -o $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) $(FTARGET).o
