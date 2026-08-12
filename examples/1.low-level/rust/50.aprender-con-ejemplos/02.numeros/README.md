[<< back](../README.md)

# Números

Vamos a hacer un programa que haga lo siguiente:
* A. Pedir al usuario un número entero N entre 10 y 20.
* B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
* C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.

**[Ejemplo 1](./01-numeros.rb): Pedir un número entre 10 y 20.**

Empezamos leyendo el valor que se pasa por los argumentos de entrada y a continuación se verifica que cumpla los requisitos:

* Pasar un argumento.
* Que sea un número.
* Que el número esté entre 10 y 20.

En caso contrario el programa termina con un código de salida distinto de cero.

Para finalizar un programa con un determinado código de error:

* `use std::process;`: indicar que vamos a usar el módulo `process`.
* `process::exit(CODE);`: invocamos la función `exit()` del módulo.
 
**Códigos de salida**

Cuando un programa termina correctamente se devuelve el código de salida 0. Si el código de salida es distinto de cero entonces es que se ha terminado con error.

Ejemplo: Ejecución que termina correctamente. Código de salida 0.

```bash
$ cargo run 16
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/numeros-01 16`

$ echo $?     
0
```

Ejemplo: Ejecución que termina con error. Código de salida 1.

```bash
$ cargo run 6
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/numeros-01 6`
Usage: target/debug/numeros-01 NUMBER
  El número NUMBER debe estar entre 10 y 20
 
$  echo $?      
1
```

**Estructura condicional**

En este ejemplo estamos usando la estructura condicional `if COND { ... }` para validar el valor de entrada.

Notar que la expresión COND que devuelve un valor booleano se escribe sin paréntesis (En Ruby también se puede escribir sin paréntesis). Si ponemos los paréntesis el compilador mostrará un _warning_, nos hará la sugerencia de quitarlos, pero el programa compila y se ejecuta.

**[Ejemplo 2](./numeros-02): Refactorizar el código.**

Refactorizar el código significa modificar el contenido pero sin modificar la funcionalidad del programa. Entonces ¿qué sentido tiene hacerlo? Modificamos el contenido para que el programa esté mejor organizado, sea más claro y nos permita ir ampliándolo de forma más cómoda.

Como en el ejemplo anterior se crearon muchas comprobaciones para realizar la tarea A (Pedir al usuario un número entero N entre 10 y 20), hemos decidido mover toda esa parte de lectura del número y su validación a otro fichero (`input.rs`).

El módulo contiene la función `input::read_valid_number()` que lee los argumentos de entrada del programa y devuelve un número entero válido, o bien termina devolviendo el código de error 1.

* `mod input;`: Para usar el módulo "input" desde "main"
* `pub fn read_valid_number() -> i32`: La función se define pública (`pub`) para que sea "visible/accesible" desde el exterior.
* La ultima línea de la función es `number` (No termina con `;`). Esto quiere decir que no es una sentencia, es una expresión y devuelve un valor. Como es la última línea, el valor de esta expresión es lo que devuelve la función (En Ruby es igual).

**[Ejemplo 3](./numeros-03): Mostrar por pantalla todos los números enteros entre el 1 y el N.**

Ahora veremos un ejemplo de la **estructura de repetición o iteración** que se emplea para ejecutar tareas repetitivas.

```rust
  for i in 1..=number {
    print!("{} ", i);
  }
```

Hay varias formas de hacer bucles (`for`, `while`, `loop/break`, etc.). En este caso, tenemos un `for` que itera sobre los elementos de la siguiente expresión `1..=number`. Esto es, un Struct ([std::ops::RangeInclusive](https://doc.rust-lang.org/std/ops/struct.RangeInclusive.html)) que tiene el Trait `Iterator` y por tanto nos permite iterar sobre sus elementos. Resumiendo, tenemos un bucle que actua con los elementos de un iterador (En Ruby funciona igual).

**[Ejemplo 4](./numeros-04): Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.**

Prácticamente, este paso se resuelve igual que el anterior. Es una tarea repetitiva, donde iteramos sobre los elementos especificados (30 -> N).

La única diferencia es que tenemos un rango diferente. Esto es, números desde 30 hast N de manera decreciente.

```rust
  for i in (number..=30).rev() {
    print!("{} ", i);
  }
```

En este caso el rango que buscamos es `(number..=30).rev()`

* `(number..=30)`: es un Struct que define un rango de elementos desde number hasta 30 inclusive. * Este struct implementa el Trait `Ìterator` y por tanto implementa el método `rev()`
* `.rev()`: es un [método del Struct que devuelve los elementos en el orden inverso](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.rev).


## Las estructuras básicas (2 de 3)

Ya conocíamos la "estructura secuencial", ahora en estos ejemplos hemos aprendido la **estructura condicional** y la **estructura repetitiva**.

---

_Hasta aquí hemos terminado de "evolucionar" los "números", ahora puedes seguir con el [siguiente problema](../03.maxmin/README.md)._
