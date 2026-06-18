# Variables
APPNAME=calculadora

ASM=nasm
ASM_FLAGS=-f elf64
LD=ld
TARGET=$(APPNAME).bin
SRC=$(APPNAME).asm
OBJ=$(APPNAME).o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(OBJ) -o $(TARGET)

$(OBJ): $(SRC)
	$(ASM) $(ASM_FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(TARGET) $(OBJ)