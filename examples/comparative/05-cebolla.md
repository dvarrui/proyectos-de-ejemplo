
# Somos como una cebolla

![](https://static1.srcdn.com/wordpress/wp-content/uploads/2018/07/Shrek-and-Donkey.jpg)

```
Shrek: Los ogros somos como... ¡cebollas!
Asno : ¿Apestan?
Shrek: ¡Nooo! ¡Capas!
       Las cebollas tienen capas.
       Los ogros tiene capas.
       Ambos tenemos capas.
Asno : ¡Oh! ¡Capas!
       Pero no a todos les gustan las cebollas.
       A todos les gustan los pasteles. Y lo hacen con capas.
Shrek: Los ogros... no son... pasteles.
```

El mundo de la informática es muy interesante. También muy extenso. No se puede ser un experto en todo. Quizás saber un poco de todo o especializarse en algunas cosas.

Para lidiar con problemas complejos hay una frase: _"Divide y vencerás"_. Como los sistemas informáticos son muy complejos se hace necesario **dividir los sistemas en capas**. Cada capa aisla una parte del sistemas del resto de capas (niveles). Entre cada nivel se establece un interfaz/protocolo/API que regula la comunicación entre un nivel y otro.

Vamos a imaginarnos un sistema de capas superpuestas, donde el nivel N se comunica con los niveles inmediatamente superior (N+1), e inmediatamente inferior (N-1). Excepto lo niveles de los extremos que sólo se comunicarán con una capa/nivel.

## Capa: Código máquina

Empecemos desde el Hardware (podríamos hacerlo más abajo... pero por ahora desde aquí valdrá). Para comunicarnos con el hardware (interacción hombre-máquina) podemos usar el código máquina.

Para programar código máquina necesitamos conocer la arquitectura de la máquina, y la tabla de códigos con las instrucciones.

Mi primero contacto con la informática fue con un MSX donde jugaba y programaba en BASIC.

Con el tiempo aprendí que el BASIC tenía instrucciones PEEK y POKE, para leer y escribir "números" en memoria. Luego aprendí que una vez escrito determinados valores numéricos en posiciones consecutivas de memoria, podía dar el control de ejecución a partir de esa posición de memoria. :-)

Mi proceso:
1. En una libreta escribía el programa en ensamblador.
1. Luego lo pasaba a números consultando la tabla de códigos del procesador Z80.
1. Hacía un programa BASIC que cargara esa secuencia de números en memoria y lo ejecutaba.

Y... ¡gualá! Ya programaba en ensamblador.

> Bueno... el proceso se repetía muchas veces para corregir los errores.

## Capa: Ensamblador

Para mejorar el proceso anterior, Kathleen Booth, inventa el primer lenguaje ensamblador.

![](https://img.microsiervos.com/images2022/KathleenBooth.jpg)

La idea es que en lugar de usar números para programar (código máquina), vamos a usar palabras. Entonces vamos a necesitar un compilador. Un programa que traduzca las palabras del lenguaje de programación ensamblador a los números del código máquina.

Pros:
* Es más fácil para el programador recordar las palabras del lenguaje de programación que los números.

Cons:
* Ahora tenemos que hacer 2 pasos en lugar de 1 para obtener un ejecutable. (1) Escribir el código fuente y (2) compilar el programa.

## Ejemplo: Sumando números

Por simplicidad, vamos a suponer una la máquina del tipo [Johnny Simulator](https://github.com/dvarrui/johnny-simulator-es). El código máquina contiene números, que son instrucciones para que la CPU haga algo con la memoria RAM y la ALU.

El siguiente ejemplo,  suma los valores de las direcciones <10> y <11>. Almacena el resultado en la dirección <12>:
```
TAKE 010
ADD  011
SAVE 012
HLT  000
```

Pros:
* Aunque es mejor (para un humano) escribir código ensamblador en lugar de código máquina, todavía tenemos que conocer bien la arquitectura de la máquina sobre la que queremos ejecutar nuestro programa.
Cons:
* El código ensamblador está acoplado a una arquitectura concreta.

## Capa: Lenguajes de bajo nivel

Si queremos que nuestro programa se pueda ejecutar en diferentes arquitecturas sin modificarlo, tenemos que escribirlo de algún modo que nuestro código no esté acoplado a la arquitectura.

Los lenguajes de bajo nivel (C, C++, Rust, Nim, etc), nos permiten escribir código independiente de la arquitectura. El compilador será el encargado de leer el código fuente y lidiar con la tarea de traducir esas órdenes a código máquina para una arquitectura objetivo.

Veamos un ejemplo en C para sumar dos números:

```
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
❯ gcc examples/051-sumar.c
❯ file a.out
a.out: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0
❯ ./a.out
Sum of 3 and 4 is: 7
```

Podríamos ver qué código ensamblador para la máquina real se genera a partir de este programa C, mediante `gcc -S examples/'515-sumar.c`. Obtenemos el siguiente fichero:

```
1		.file	"051-sumar.c"
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

C es más sencillo de usar, pero cuando queremos usar una variable hay que especificar el tipo (tipado estático). Esto es, indicar el tipo de dato que almacenará. Esto es necesario para que el compilador tenga la información del número de bytes que tiene que reservar para cada variable.

Si cambiamos num1 y num2 por 10000000000 tenemos un error de desbordamiento:
```
❯ gcc examples/052-sumar.c
examples/052-sumar.c: En la función ‘main’:
examples/052-sumar.c:5:10: aviso: el desbordamiento en la conversión de ‘long int’ a ‘int’ cambia el valor de ‘10000000000’ a ‘1410065408’ [-Woverflow]
    5 |   num1 = 10000000000;
      |          ^~~~~~~~~~~
```

El espacio reservado para almacenar una variable de tipo `int` no es suficiente (en esta arquitectura) para guardar el valor 10000000000.
