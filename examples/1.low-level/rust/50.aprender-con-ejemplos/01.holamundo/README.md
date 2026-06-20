[<< back](../README.md)

# Hola Mundo

¡Hola Mundo! Lo típico es empezar por el "Hola Mundo!". Así que vamos, pero vamos a hacer un programa que haga lo siguiente:

- A. Pedir por teclado el nombre, edad y altura en metros, 
- B. Mostrar por pantalla un mensaje como el siguiente: `El personaje NAME, tiene AGE años de edad y mide HEIGHT metros.`

**[Ejemplo 0](./00-holamundo.rs): Escribimos las ideas como comentarios.**

Esto realmente, no es un programa porque no hace nada. Simplemente vamos a crear comentarios con los objetivos que queremos desarrollar para que tener un esquema inicial.

Para construir el ejecutable tengo que compilar el código fuente. Esto se hace con `rustc 00-holamundo.rs`, pero si el fichero sólo contiene comentarios el compilador se va a quejar, entonces tengo que añadir la función principal `fn main() {}`, vacía.

Ahora si compila un ejecutable `00-holamundo`, que no hace nada.

Nos damos cuenta de algo raro.

```bash
$ du -sh 00-holamundo
4,2M	00-holamundo
```

El ejecutable que no hace nada ocupa 4.2 MB. ¡Algo excesivo! 

**¿Por qué?**

El compilador de Rust incluye código "por defecto" para hacer el programa robusto, seguro y portátil. Por ejemplo:

1. Información de Depuración (Debug Symbols): Son metadatos para las herramientas de depuracion.
2. La Biblioteca Estándar de Rust (std): Manejo de hilos, panics, asignación de memoria, y capacidades de formateo de cadenas. Se incluye para garantizar que, sea cual sea el sistema operativo, las funciones básicas funcionen de forma segura y consistente.
3. El Runtime de Rust que se encarga de:
    - Configurar la pila (stack) de los hilos.
    - Manejar señales del sistema operativo.
    - Coordinar la ejecución del main.

**¿Cómo reducir el tamaño al compilar con rustc?**


| Flag             | Descripción |
| ---------------- | ------------------------------------ |
| -C opt-level=z   | Prioriza tamaño sobre la velocidad   |
| -C lto=fat       | Aplica optimización de enlazado      |
| -C strip=symbols | Eliminar los metadatos de depuración |
| -C panic=abort   | No incluir mecanismos de recuperación de errores críticos |

```bash
$ rustc -C opt-level=z -C lto=fat -C strip=symbols -C panic=abort 00-holamundo.rs
```

> Por comodidad, me creo un alias `rsc` con todo e "churro" de la compilación optimizada de Rust. _No voy a escribir todas esas opciones manualmente todo el tiempo_

```bash
$ alias rsc
rsc='rustc -C opt-level=z -C lto=fat -C strip=symbols -C panic=abort'

$ rsc 00-holamundo.rs

$ du -sh 00-holamundo
280K	00-holamundo
```

**[Ejemplo 1](./01-holamundo.rs): print!() y println!() para mostrar por pantalla.**

En este primer ejemplo vamos a mostrar por pantalla directamente el mensaje:

```
El pesonaje Obiwan, tiene 57 años de edad y mide 1.80 metros.
```

Si nos fijamos en el código, vemos que hemos usado `print!()` y `println!()`. Realmente con una línea lo resolvíamos pero se ha puesto así por motivos didácticos, para ver la diferencia entre ambos. 
* `print!()`: Muestra por pantalla sin retorno de carro.
* `println()`: Muestra por pantalla con retorno de carro.

Nos fijamos en otro detalle, las funciones anteriores tienen el sufijo `!`. ¿Por qué? Dependiendo del lenguaje de programación que vengas te parecerá más o menos raro o más o menos normal. Lo lenguajes más "populares" no usar el símbolo de exclamación como parte del nombre, pero otros lenguajes, por ejemplo Ruby si que lo usan. Y no pasa nada.

¿Pero cuál es la razón? _¡Tiene que haber una razón!_. El sufijo `!` en el nombre de la función sirve para indicar que es una "macro" y no una función estándar. Las macros generan un código fuente que se sustituye antes de compilar. Esto es, las marcros no se compilan, se sustituye y luego se compila.

> Voy a usar `cargo` para crear un proyecto pero no lo explicamos ahora.

Veamos un ejemplo donde expandimos las macros:

* Creo un proyecto con `cargo`, y edito el código fuente:

```bash
$ cargo new holamundo
$ cd holamundo
...editar el fichero src/main.rs...
$ cat src/main.rs 
fn main() {
    println!("Hello, world!");
}
```

* Usamos `cargo` para instalar la biblioteca que necesitamos y para expandir las macros del proyecto:

```bash
$ cargo install cargo-expand
$ cargo expand

    Checking holamundo v0.1.0 (.../holamundo)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.05s

#![feature(prelude_import)]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
fn main() {
    {
        ::std::io::_print(format_args!("Hello, world!\n"));
    };
}
```

Podemos comprobar cómo se añaden líneas al código fuente antes de compilarse. No las vamos a explicar ahora. De momento, sólo es necesario saber que son las macros y qué hacen.

> Las macros sirven (entre otras cosas) para facilitarnos la escritura de los programas.

**[Ejemplo 2](./02-holamundo.rs): Ahora con variables.**

Ahora vamos a usar variables (`name`, `age` y `height`) para poner cada valor por separado.

Otra observación, es que a la hora de imprimir con `println!()`, le pasamos varios argumentos: Un texto y las variables. Las marcas `{}` se reemplazan por el contenido de cada una de las variables.

**[Ejemplo 3](./03-holamundo.rs): probando cosas raras**

¿Qué pasaría si el número de marcas `{}` no coincide con el número de variables?

* ¿Qué pasa cuando tenemos menos marcas `{}` que variables?
* ¿Qué pasa cuando tenemos más marcas `{}` que variables?


```bash
$ rustc 03-holamundo.rs

error: argument never used
 --> 03-holamundo.rs:9:82
  |
9 |     println!("El personaje {}, tiene {} años de edad y mide metros.", name, age, height);
  |              -------------------------------------------------------             ^^^^^^ argument never used
  |              |
  |              formatting specifier missing

error: 3 positional arguments in format string, but there are 2 arguments
  --> 03-holamundo.rs:10:28
   |
10 |     println!("El personaje {}, tiene {} años de edad y mide {} metros.", name, age);
   |                            ^^        ^^                     ^^           ----  ---

error: aborting due to 2 previous errors
```

Pues que el compilador lo detecta y nos muestra el error. El código no compilará hasta que los escribamos de forma correcta.

**[Ejemplo 4](./04-holamundo.rs): Leer del teclado.**

Ahora los valores de las variables los introduce el usuario mediante `read_line(&mut name)`. Esta función lee la entrada de teclado (incluyendo el salto de línea), de modo que para obtener el valor del nombre sin el retorno de carro usaremos `let name = name.trim();`.


Ejemplo:

```ruby
film = " star wars \n"
film.chmop #=> " star wars "
```

La variable `age` debe contener un número entero, de modo que al leer la entrada del teclado, que es un String (`gets` devuelve un String)), sobre la marcha lo convertimos en un integer con `gets.to_i`.

La variable `height` debe tener un valor Float, entonces siguiendo la misma lógica lo hacemos con `gets.to_f`.

**[Ejemplo 5](./cargo.d/holamundo-05): Poniendo un poco de color a la vida.**

Para poder colorear el texto en el terminal hay que instalar una biblioteca llamada `colored`, pero como hacerlo forma "manual" implica hacer muchos pasos vamos a seguir otro camino más fácil y más "rustacean". 

Hast ahora, habíamos trabajado creando ficheros individuales y compilándolos manualmente con `rustc`. Ahora trabajaremos en proyectos. Para gestionar los proyectos de Rust usaremos la herramienta `cargo`.

* Creamos el nuevo proyecto:

```bash
$ cd cargo.d
$ cargo new holamundo-05
```

```
holamundo-05
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs
```

El fichero `holamundo-05/Cargo.toml` es el fichero de configuración principal del proyecto.Añadimos la biblioteca que necesitamos en la sección `[dependencies]`:

```ini
[package]
name = "holamundo-05"
version = "0.1.0"
edition = "2024"

[dependencies]
colored = "2"
```

En la sección `[dependencies]` sólo tenemos que poner el nombre de la biblioteca y su versión: `colored = "2"`. A continuación ejecutamos `cargo run`, y Rust se encarga de todo:

* Descargar e instalar las dependencias.
* Compilar y contruir el ejecutable.
* Ejecutar el programa

```bash
$ cargo run
    Updating crates.io index
     Locking 12 packages to latest Rust 1.96.0 compatible versions
      Adding colored v2.2.0 (available: v3.1.1)
  Downloaded lazy_static v1.5.0
  Downloaded colored v2.2.0
  Downloaded 2 crates (47.9KiB) in 0.26s
   Compiling lazy_static v1.5.0
   Compiling colored v2.2.0
   Compiling holamundo-05 v0.1.0 (.../cargo.d/holamundo-05)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 1.10s
     Running `target/debug/holamundo-05`

Name: Obiwan
Age: 57
Height: 1.80
El personaje OBIWAN, tiene 57 años de edad y mide 1.8 metros.
```

Para que el código sea un poco más legible hemos creado nuevas variables coloreadas. Por ejemplo `colored_name` tiene el mismo contenido de `name` pero incluyendo el color.

Más información:

* Sobre `colored`:
    * Página en **crates.io**: https://crates.io/crates/colored
    * Documentación oficial: https://docs.rs/colored/latest/colored/
* Sobre `String`: https://doc.rust-lang.org/std/string/struct.String.html
* Sobre otras bibliotecas (`crates`): https://crates.io/.

También hago lo siguiente:
* `cargo fmt`: para formatear el código según el estilo Rust.
* `cargo clippy`: ejecutar este asistente que me hacer sugenrencias para mejorar.

---
Cuando ponemos el nombre, puede ser que los escribamos `Obiwan` o nos equivoquemos y pongamos `obiwan` por ir un poco rápido. Esto lo podemos mejorar usando el método `capitalize()` del String. Ejemplo: ` "obiwan".capitalize => "Obiwan".

**[Ejemplo 6](./06-holamundo.rb): Mejorando el interfaz de entrada.**

Es este ejemplo vamos a usar otra gema (`tty-prompt`). Ya está instalada con el proceso del ejemplo anterior (`bundle install`). Ahora para usarla dentro de nuestro programa ponemos `require "tty-prompt"`.

Se crea un objeto `prompt = TTY::Prompt.new`. Ahora usando el método `ask(MESSAGE, default: VALUE)` del objeto mostramos MESSAGE por pantalla y si pulsamos enter la variable de carga por defecto con el valor VALUE. Esto mejora notablemente la usabilidad del programa.

**[Ejemplo 7](./07-holamundo.rb): Paso de argumentos de entrada. Es lo habitual en comandos y scripts.**

En esta versión del programa vamos a usar otra forma de introducir los datos al programa (script). Vamos a usar el paso de argumentos. En este caso el programa se invoca en el terminal de la siguiente forma: `./07-holamundo.rb NAME AGE HEIGHT`

Ejemplo de uso:

```bash
$ ./07-holamundo.rb obiwan 57 1.80
El personaje Obiwan, tiene 57 años de edad y mide 1.8 metros.```
```

Para leer los argumentos existe el objeto `ARGV`. Realmente es un Array (o lista)

> **NOTA:** En Ruby a las listas se les llama Array. Los Array de Ruby no tienen tamaño fijo.
>
> Esto puede confundir, dependiendo del lenguaje de programación que vengas, ya que en otros lenguajes de programación a este tipo de objetos se les llama List, y se usa Array cuando son listas de tamaño fijo en memoria.
>
> IMHO: El nombre List hubiera sido un poco más "adecuado".

**[Ejemplo 8](./08-holamundo.rb): Cambiamos la lógica para separ metros de centímetros.**

Vamos modificar el mensaje de salida del siguiente modo:

```
El usuario NAME, de AGE años de edad y mide MTS metros y CMS centímetros.”
```

El usuario introduce su altura en la forma `1.80` (variable `height`), y nosotros tenemos que separar la parte entera de la parte decimal de la siguiente forma:

```ruby
# Nos quedamos con la parte entera de la altura
mts = height.to_i 

# Nos quedamos con la parte decimal, luego ese valor lo multiplicamos por 100
# y redondeamos sin dejar decimales en el resultado final.
cms = ((height % mts) * 100).round(0) 
```

## Las estructuras básicas (1 de 3)

```
Estructuras básicas 
de la programación imperativa estructurada
```

Hay distintos paradígmas de programación, pero no vamos a liarnos ahora con eso. Sólo saber que estamos aprendiendo programación siguiendo el camino de la **programación imperativa estructurada**. Según esta forma de programar, sólo necesitamos aprender 3 estructuras básicas y con ellas podemos hacer cualquier programa. Estas son:

* **Estructura secuencial**: La estructura secuencial implica que tenemos instrucciones/acciones que se ejecutan en secuencia, una detrás de otra. Esta estructura la acabamos de aprender. Todos los ejemplos de [holamundo](./) que hemos visto tienen estructura secuencial.
* **Estructura condicional**: Esta estructura nos permite tomar decisiones en tiempo de ejecución y decidir y se ejecutan las acciones a1, a2, a3 o las acciones b1, b2, b3.
* **Estructura bucle y/o iterador**: Bucle e iterador no son estrictamente lo mismo. Ya lo veremos. Pero nos basta con quedarnos con la idea de que con los bucles y/o iteradores podemos repetir las acciones.

---

_Hasta aquí hemos terminado de "evolucionar" el "hola mundo" ahora puedes seguir con el [siguiente problema](../02.numeros/README.md)._
