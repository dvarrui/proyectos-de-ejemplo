
NAME=$1
EXE=$1.bin

echo "==> compile: $NAME.asm"
nasm -f elf $NAME.asm

echo "==> Link object file: $NAME.o"
ld -m elf_i386 -s -o $EXE $NAME.o

echo "==> execute: $EXE"
echo "    -------------"
./$EXE
