
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

## Ejemplo1: Hola Mundo

Creamos el archivo [hola.asm](./hola.asm). En este ejemplo utilizaremo NASM y las llamadas al sistema (syscalls) de Linux de 64 bits.

* Compilación y Ejecución
    - Ensamblar: Genera el archivo objeto. `nasm -f elf64 hola.asm -o hola.o`
    - Enlazar: Crea el ejecutable final. `ld hola.o -o hola.bin`
    - Ejecutar: `./hola.bin`

**Conceptos:**

* Syscalls: En Linux, te comunicas con el kernel mediante syscall. Cada operación (leer archivos, escribir en pantalla) tiene un número asignado que pones en el registro RAX.
* Registros de 64 bits: Usarás RAX, RBX, RCX, RDX, etc.
* Formato ELF: Es el formato estándar de ejecutables en Linux (equivalente al .exe de Windows).

## Código máquina

Si quieres ver cómo el ensamblador ha convertido el código en bytes, puedes usar la herramienta objdump que instalamos al principio:

1. `nasm -f elf64 hola.asm -o hola.o`: Primero compila el objeto
2. `objdump -d hola.o`: Luego vuelca el contenido hexadecimal

```
hola.o:     formato del fichero elf64-x86-64

Desensamblado de la sección .text:

0000000000000000 <_start>:
   0:	b8 01 00 00 00       	mov    $0x1,%eax
   5:	bf 01 00 00 00       	mov    $0x1,%edi
   a:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
  11:	00 00 00 
  14:	ba 15 00 00 00       	mov    $0x15,%edx
  19:	0f 05                	syscall
  1b:	b8 3c 00 00 00       	mov    $0x3c,%eax
  20:	48 31 ff             	xor    %rdi,%rdi
  23:	0f 05                	syscall
```

## Ejemplo 2: calculadora

El programa [calculadora.asm](./calculadora.asm) suma dos números y resta un tercero. Como este programa no "imprime" texto, ya que convertir números a texto es un proceso más largo en ensamblador, entonces para ver el resultado podemos:

(A) Verificar el valor de retorno del programa:
1. Compila con make.
1. Ejecuta: ./calculadora
1. Inmediatamente después, escribe: echo $?

La terminal imprimirá 12, que es el resultado que quedó en el registro al finalizar.

(B) Depurar con GDB
1. Compila para depurar: `nasm -f elf64 -g calculadora.asm -o calculadora.o` y luego el ld.
1. Entra al depurador: `gdb ./calculadora`
1. Dentro de GDB, escribe estos comandos:
    * layout regs (Esto abrirá una ventana increíble donde verás los registros cambiar).
    * break _start (Poner un punto de interrupción).
    * run (Iniciar).
    * stepi (Avanzar instrucción por instrucción).

