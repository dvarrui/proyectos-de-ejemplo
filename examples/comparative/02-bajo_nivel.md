[<< back](README.md)

## Capa: Lenguajes de bajo nivel

Si queremos que nuestro programa se pueda ejecutar en diferentes arquitecturas sin modificarlo, tenemos que escribirlo de algún modo que nuestro código no esté acoplado a la arquitectura.

Los lenguajes de bajo nivel (C, C++, Rust, Nim, etc), nos permiten escribir código independiente de la arquitectura. El compilador será el encargado de leer el código fuente y lidiar con la tarea de traducir esas órdenes a código máquina para una arquitectura objetivo.

Veamos un ejemplo en C para sumar dos números:

```c
#include <stdio.h>

int main() {
  int num1, num2, sum;
  num1 = 3;
  num2 = 4;
  sum = num1 + num2;

  printf("Sum of %d and %d is: %d\n", num1, num2, sum);
  return 0;
}
```

Para obtener un ejecutable (fichero con el código máquina) debemos compilar:

```
❯ gcc examples/021-sumar.c
❯ file a.out
a.out: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0
❯ ./a.out
Sum of 3 and 4 is: 7
```

Podríamos ver qué código ensamblador para la máquina real se genera a partir de este programa C, mediante `gcc -S examples/'021-sumar.c`. Obtenemos el siguiente fichero:

```
 1		.file	"021-sumar.c"
 2		.text
 3		.section	.rodata
 4	.LC0:
 5		.string	"Sum of %d and %d is: %d\n"
 6		.text
 7		.globl	main
 8		.type	main, @function
 9	main:
10	.LFB0:
11		.cfi_startproc
12		pushq	%rbp
13		.cfi_def_cfa_offset 16
14		.cfi_offset 6, -16
15		movq	%rsp, %rbp
16		.cfi_def_cfa_register 6
17		subq	$16, %rsp
18		movl	$3, -4(%rbp)
19		movl	$4, -8(%rbp)
20		movl	-4(%rbp), %edx
21		movl	-8(%rbp), %eax
22		addl	%edx, %eax
23		movl	%eax, -12(%rbp)
24		movl	-12(%rbp), %ecx
25		movl	-8(%rbp), %edx
26		movl	-4(%rbp), %eax
27		movl	%eax, %esi
28		movl	$.LC0, %edi
29		movl	$0, %eax
30		call	printf
31		movl	$0, %eax
32		leave
33		.cfi_def_cfa 7, 8
34		ret
35		.cfi_endproc
36	.LFE0:
37		.size	main, .-main
38		.ident	"GCC: (SUSE Linux) 12.2.1 20221020 [revision 0aaef83351473e8f4eb774f8f999bbe87a4866d7]"
39		.section	.note.GNU-stack,"",@progbits
```

Es más complicado de entender el ensamblador puesto que hay conocer los registros que dispone nuestra arquitectura para programar.

## Tamaño de las variables

C es más sencillo de usar, pero cuando queremos usar una variable hay que especificar el tipo (tipado estático). Esto es, indicar el tipo de dato que almacenará. Esto es necesario para que el compilador tenga la información del número de bytes que tiene que reservar para cada variable.

Si cambiamos el valor de num1 por 10000000000, tenemos un error de desbordamiento:
```
❯ gcc examples/022-sumar.c
examples/022-sumar.c: En la función ‘main’:
examples/022-sumar.c:5:10: aviso: el desbordamiento en la conversión de ‘long int’ a ‘int’ cambia el valor de ‘10000000000’ a ‘1410065408’ [-Woverflow]
    5 |   num1 = 10000000000;
      |          ^~~~~~~~~~~
```

El espacio reservado para almacenar el valor de nuestra variable de tipo `int` puede ser suficiente o no, dependiendo de la arquitectura. El tamaño en bytes que se utiliza para guardar un dato `int` de C dependerá del compilador, del SO y de la plataforma.

> Enlace de interés:
> * https://stackoverflow.com/questions/7180196/size-of-integer-in-c

En mi caso, obtengo los siguientes tamaños, pero no se puede garantizar que el programa se va a comportar igual en distintas plataformas.

```
❯ gcc examples/023-size_of.c
❯ ./a.out
size of int : 4
size of signed int : 4
size of unsigned long : 8
```

En cambio, si usamos Rust, nos aseguramos de que al especificar el tipo de dato además especificamos la capacidad de almacenamiento que se usará (https://doc.rust-lang.org/book/ch03-02-data-types.html). Usando el tipo `i32`, estamos especificando tamaño de 4 bytes (32 bits) con signo.

```ruby
fn main() {
    let num1: i32;
    let num2: i32;
    let sum: i32;

    num1 = 4;
    num2 = 3;
    sum = num1 + num2;
    println!("{} + {} = {}", num1, num2, sum);
}
```

## Estructuras de control

En el documento anterior vimos un ejemplo de multiplicación en ensamblador, que implementaba una tarea repetitiva. No hablamos de estructura repetitiva.

A medida que programamos, detectamos secuencias o patrones de código que se repiten que nos sirven para resolver problemas similares.

De este modo tenemos las estructuras de control:
* Secuencial
* Condicional
* Repetitiva
