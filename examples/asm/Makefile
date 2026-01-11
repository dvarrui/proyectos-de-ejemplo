# Variables
ASM=nasm
ASM_FLAGS=-f elf64
LD=ld
TARGET=hola.bin
SRC=hola.asm
OBJ=hola.o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(OBJ) -o $(TARGET)

$(OBJ): $(SRC)
	$(ASM) $(ASM_FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(TARGET) $(OBJ)