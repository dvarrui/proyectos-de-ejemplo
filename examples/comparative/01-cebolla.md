[<< back](README.md)

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
