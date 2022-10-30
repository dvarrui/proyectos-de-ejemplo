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

## Ejemplo: Multiplicación de números

Veamos otro ejemplo de código ensamblador de nuestra máquina "Johnny Simulator".

Como no existe la instrucción de mutiplicar, entonces la multiplicación de num1 (dirección <10>) por num2 (dirección <11>) se lleva a cabo haciendo sumando repetidas veces el contenido de num1 en la posición de memoria del resultado final (dirección <12>), la cual se inicializa previamente a cero.

```
000: NULL 012
001: TAKE 012
002: ADD  010
003: SAVE 012
004: DEC  011
005: TST  011
006: JMP  001
007: HLT  000
```

En cada ciclo el valor de la dirección <11> se reduce en 1. El bucle continúa hasta que el valor de la dirección <11> haya llegado al valor 0.

Cons:
* Para poder entender el código del programa ensamblador, **necesitamos de documentación** (una explicación). En caso contrario es muy difícil entenderlo (para un humano).
* **Vemos que no tenemos estructuras de control** ([condicionales](https://es.wikipedia.org/wiki/Sentencia_condicional) y bucles). De hecho ese concepto no existe en ensamblador porque no es un elemento de la máquina. Y hemos dicho que este lenguaje está directamente relacionado con la máquina. Lo que la máquina tiene es lo que nos deja ver el lenguaje.

**ACLARACIÓN**

Se podría discutir si hemos programado una estructura condicional, un bucle o no, así que vamos a matizarlo un poco. Realmente hemos creado un programa que realiza una tarea repetitiva, donde se pregunta por el estado de una posición de memoria (`TST 011`) y en función del resultado se realiza o no un salto (`JMP 001`). Por tanto diremos que tenemos un "bucle", pero no vamos a llamarlo "estructura iterativa" por el momento. Volveremos a este asunto más adelante.

Realmente, a partir de aquí se podría construir todo lo que se lleva a cabo en las capas superiores. Pero somos humanos y necesitamos ir capa por capa para que nuestra mente pueda lidiar con tanta complejidad.

Cada nivel N "simplifica" funciones del nivel anterior (N-1) para hacerlos más fáciles de usar por los humanos. Y cuando el nivel N se vuelve demasiado "engorroso" necesitamos crear el nivel N+1 que continua el proceso de simplificar.

La simplificación que produce N+1 sobre N
* Nos da la ventaja de poder hacer cosas más complicadas de forma más sencilla. El nivel N+1 es una abstracción del nivel N.
* Pero por el contrario, perdemos la posibilidad de acceder al nivel de detalle que nos ofrece el nivel N.
