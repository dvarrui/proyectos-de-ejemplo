
# Ensamblador

El ensamblador de Windows es diferente que el de GNU/Linux. El estándar suele ser la sintaxis AT&T, aunque la mayoría de los desarrolladores prefieren la sintaxis Intel por ser más legible.

## Herramientas principales

Para programar en ensamblador, necesitas principalmente dos cosas: un ensamblador (que traduce el código a objeto) y un enlazador (que crea el ejecutable).

* NASM (Netwide Assembler): 
    - Ensamblador. Traduce el código a objeto.
    - El más popular para sintaxis Intel. Es muy versátil y bien documentado.
* GAS (GNU Assembler): 
    - Viene por defecto con las herramientas de desarrollo de Linux (binutils). Usa AT&T por defecto.
    - Enlazador
* GDB: 
    - El depurador (ver los registros y la memoria en tiempo real)
* Editor: Se puede usar cualquier editor de texto (Vim, Kate, Gedit), pero Codium tiene la extensión "x86 and x86_64 Assembly" que hace resaltado de sintaxis y autocompletado.

Instalación en OpenSUSE

```bash
sudo zypper install nasm binutils gdb
```

## Ejemplo práctico: "Hola Mundo" (x86_64)

Creamos el archivo [hola.asm](./hola.asm). En este ejemplo utilizaremo NASM y las llamadas al sistema (syscalls) de Linux de 64 bits.

* Compilación y Ejecución
    - Ensamblar: Genera el archivo objeto. `nasm -f elf64 hola.asm -o hola.o`
    - Enlazar: Crea el ejecutable final. `ld hola.o -o hola.bin`
    - Ejecutar: `./hola.on`

## Conceptos

* Syscalls: En Linux, te comunicas con el kernel mediante syscall. Cada operación (leer archivos, escribir en pantalla) tiene un número asignado que pones en el registro RAX.
* Registros de 64 bits: Usarás RAX, RBX, RCX, RDX, etc.
* Formato ELF: Es el formato estándar de ejecutables en Linux (equivalente al .exe de Windows).
