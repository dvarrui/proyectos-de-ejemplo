[<< back](README.md)

# Paradigmas

Wikipedia: Forma de clasificar los lenguajes de programación en función de sus características.

Los paradigmas de programación:
* imperativo en el que el programador instruye a la máquina cómo cambiar su estado,
    * procedimental que agrupa las instrucciones en procedimientos,
    * orientado a objetos que agrupa las instrucciones con la parte del estado en el que operan,
* declarativo en el que el programador simplemente declara las propiedades del resultado deseado, pero no cómo calcularlo
    * funcional en el que el resultado deseado se declara como el valor de una serie de aplicaciones de función,
    * lógico en la que el resultado deseado se declara como la respuesta a una pregunta sobre un sistema de hechos y reglas,
    * matemático en el que el resultado deseado se declara como la solución de un problema de optimización
    * reactivo en el que se declara el resultado deseado con flujos de datos y la propagación del cambio

# 1. Multiplicación en ensamblador

Supongamos que tenemos este programa de "Multiplicación de números". que es un programa en ensamblador para un hardware muy básico del simulador "Johnny Simulator",

Como no existe la instrucción de mutiplicar, entonces la multiplicación de num1 (dirección <10>) por num2 (dirección <11>) se lleva a cabo haciendo sumando repetidas veces el contenido de num1 en la posición de memoria del resultado final (dirección <12>), la cual se inicializa previamente a cero.

```
000: NULL 010
001: TAKE 010
002: ADD  011
003: SAVE 010
004: DEC  012
005: TST  012
006: JMP  001
007: HLT  000
---
010: 0
011: 5
012: 4
```

En cada ciclo el valor de la dirección <11> se reduce en 1. El bucle continúa hasta que el valor de la dirección <11> haya llegado al valor 0.

## 1.1 Abstracción 1

Vamos a reproducir el ejemplo, usando una representación de más alto nivel.

```ruby
res = 0
num1 = 5
num2 = 4

repeat:
res = res + num1
num2 = num2 -1

if num2 == 0 { goto :end }
goto :repeat
:end
```

* En este paso se realizan abstracciones para tener una visión simplificada del paso anterior, de modo que se más comprensible a un humano.
* Pero por contra, perdemos detalles como por ejemplo:
    * posiciones de memoria de los datos e instrucciones.

## 1.2 Abstracción 2

```ruby
res = 0
num1 = 5
num2 = 4

while(num2>0) {
  res = res + num1
  num2 = num2 - 1
}
```

* En este paso se realizan abstracciones para tener una visión simplificada del paso anterior, de modo que se más comprensible a un humano.
* Pero por contra, perdemos detalles como por ejemplo:
    * Información sobre las etiquetas y `goto` que sirven para controlar los saltos.

## 1.3 Abstracción 3

```ruby
num1 = 5
num2 = 4
res = num1 * num2  
```

* En este paso se realizan abstracciones para tener una visión simplificada del paso anterior, de modo que se más comprensible a un humano.
* Pero por contra, perdemos detalles como por ejemplo:
    * Información sobre cómo se está implementando la operación de multiplicación.

## 1.4 Reflexión

Cada capa o nivel de abstracción que añadimos:
* Facilita la escritura/lectura del humano.
* Oculta algunos detalles de la capa anterior porque que no interesan al usuario.

# 2. Tarea repetitiva o bucles

Veamos un ejemplo de una tarea repetitiva o bucle.

Empezamos usando una forma imperativa. Esto es, indicando a la máquina los pasos que tiene que dar.

```ruby
numbers = [4, 6, 10, 11, 12, 13, 16]

max = numbers.size
i = 0
while(i<max) {
  print numbers[i]
  i = i +1
}
```

## 2.1 Abstracción 1

```ruby
numbers = [4, 6, 10, 11, 12, 13, 16]

for(i=0, i++, i<numbers.size) {
  print  numbers[i]  
}
```

* En este paso se realizan abstracciones para tener una visión simplificada del paso anterior, de modo que se más comprensible a un humano.
* Pero por contra, perdemos detalles como por ejemplo:
    * La gestión de la variable auxiliar `i` que sirve de índice para la lista se.

## 2.2 Abstracción 2

```ruby
numbers = [4, 6, 10, 11, 12, 13, 16]

for value in numbers {
  print  value
}
```

* En este paso se realizan abstracciones para tener una visión simplificada del paso anterior, de modo que se más comprensible a un humano.
* Pero por contra, perdemos detalles como por ejemplo:
    * La variable de índice desaparece.
