[<< back](../README.md)

# Hola Mundo

_¡Hola Mundo!_ Lo típico es empezar por el "Hola Mundo!", pero vamos a hacer un programa que haga lo siguiente:

- A. Pedir por teclado el nombre, edad y altura en metros, 
- B. Mostrar por pantalla un mensaje como el siguiente: `El personaje NAME, tiene AGE años de edad y mide HEIGHT metros.`

**[Ejemplo 0](./00-holamundo.rs): Escribimos los objetivos como comentarios.**

Empezamos con un fichero llenos de comentarios con los objetivos que queremos implementar a modo de esquema inicial. Realmente, no es un programa porque no hace nada. Pero vamos a compilarlo con `rustc holamundo-00.rs`.

```bash
$ rustc holamundo-00.rs 
error[E0601]: `main` function not found in crate `00_holamundo`
 --> 00-holamundo.rs:7:2
  |
7 |
  | ^ consider adding a `main` function to `00-holamundo.rs`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0601`.
```

Teniendo el código de error, podemos obtener más información:

```bash
$ rustc --explain E0601

No main function was found in a binary crate.
To fix this error, add a main function:

fn main() {
    // Your program will start here.
    println!("Hello world!");
}

If you don't know the basics of Rust, you can look at the Rust Book to get started.
```

El compilador se "queja" porque no existe la función principal `main()`, de modo que la creamos aunque esté vacía por ahora. Ahora si compila y obtenemos un ejecutable `holamundo-00`, que hace "nada".

> **INFO**: Consultar el litado de errores https://doc.rust-lang.org/error_codes/error-index.html.

Nos damos cuenta de algo raro.

```bash
$ du -sh holamundo-00
4,2M	holamundo-00
```

El ejecutable que no hace nada ocupa 4.2 MB. _¡Algo excesivo!_

**¿Por qué?**

El compilador de Rust incluye código "por defecto":

1. Metadatos para las herramientas de depuracion.
2. La Biblioteca Estándar (`std`): Manejo de hilos, panics, asignación de memoria, y formateo de cadenas, etc. Se incluyen para garantizar que, sea cual sea el sistema operativo, las funciones básicas funcionen de forma segura y consistente.
3. El Runtime de Rust, que se encarga de:
    - Configurar la pila (stack) de los hilos.
    - Manejar señales del sistema operativo.
    - Coordinar la ejecución del main.

**¿Cómo reducir el tamaño al compilar con rustc?**

El compilador tiene muchos parámetros, como por ejemplo:

| Flag             | Descripción |
| ---------------- | ------------------------------------ |
| -C opt-level=z   | Prioriza tamaño sobre la velocidad   |
| -C lto=fat       | Aplica optimización de enlazado      |
| -C strip=symbols | Eliminar los metadatos de depuración |
| -C panic=abort   | No incluir mecanismos de recuperación de errores críticos |

Entonces compilaremos de la siguiente forma:

```bash
$ rustc -C opt-level=z -C lto=fat -C strip=symbols -C panic=abort 00-holamundo.rs
```

Pero, por mi comodidad, me voy a crear un alias `rsc` con todo ese "churro" de la compilación optimizada de Rust. _No voy a escribir todas esas opciones manualmente todo el tiempo_

```bash
$ alias rsc
rsc='rustc -C opt-level=z -C lto=fat -C strip=symbols -C panic=abort'

$ rsc holamundo-00.rs

$ du -sh holamundo-00
280K	holamundo-00
```

_Ahora el ejecutable tiene un tamaño más razonable._

**[Ejemplo 1](./holamundo-01.rs): print!() y println!() para mostrar por pantalla.**

En este primer ejemplo vamos a mostrar por pantalla directamente el mensaje:

```
El pesonaje Obiwan, tiene 57 años de edad y mide 1.80 metros.
```

En el código hemos usado `print!()` y `println!()`. Realmente no hacía falta. Con una línea lo resolvíamos pero se ha puesto así por motivos didácticos, para ver la diferencia entre ambos. 

* `print!()`: Muestra por pantalla sin retorno de carro.
* `println()`: Muestra por pantalla con retorno de carro.

Nos fijamos en otro detalle. Las funciones anteriores tienen el sufijo `!`. ¿Por qué? Dependiendo del lenguaje de programación que vengas te parecerá más o menos raro. Lo lenguajes más "populares" no usan el símbolo de exclamación como parte del nombre de las funcioneso métodos, pero otros lenguajes, por ejemplo Ruby si que lo usan. Y no pasa nada.

¿Pero cuál es la razón? _¡Tiene que haber una razón!_. El sufijo `!` en el nombre de la función sirve para indicar que es una "macro" y no una función estándar. Las macros generan un código fuente que se sustituye en el código antes de compilar.

> **NOTA**: Voy a usar `cargo` para crear un proyecto de ejemplo y comprobar cómo se expanden las macros.

Veamos un ejemplo donde expandimos las macros:

* Creo un proyecto con `cargo`, y edito el código fuente:

```bash
$ cargo new holamundo-01

$ cd holamundo-01
...editar el fichero src/main.rs...

$ cat src/main.rs 
fn main() {
    println!("Hello, world!");
}
```

* `cargo install cargo-expand`, para instalar la biblioteca que se necesita.
* Expandimoslas macros del proyecto:

```bash
$ cargo expand

    Checking holamundo-01 v0.1.0 (.../holamundo-01)
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

Aparecen líneas nuevas en el código fuente antes de compilarse. No las vamos a explicar ahora. De momento, sólo es necesario saber que las macros sirven para incluir código y facilitar la escritura de los programas. Pero... si nos fijamos, en la "expansión" del código, aparece otra macro que antes no veíamos (`format_args!`). _¿Pero esta macro no se expande?_

`format_args!` "no se expande" porque no es una macro convencional (escrita en código fuente Rust) que podamos inspeccionar. Es una macro integrada en el compilador (builtin macro) y tiene un tratamiento especial.

**[Ejemplo 2](./holamundo-02.rs): Ahora con variables.**

Ahora vamos a usar variables (`name`, `age` y `height`) para poner cada valor por separado. A la hora de imprimir con `println!()`, pasamos como argumentos un texto y las variables. Las marcas `{}` indican las posiciones donde se incrustarán los valores de cada variable.

_Pero, ¡pensaba que Rust era un lenguaje con tipado estático!. ¡No hay declaración de tipos!_ Rust SI es un lenguaje de tipado estático. SI hay que declarar los tipos de las variables, pero cuando el tipo no está especificado de forma explícita Rust intenta resolverlos con inferencia de tipos.

Veamos un ejemplo con declaración explícita de tipos estáticos:

```rust
let name: &str = "Obiwan";
let age: i32 = 57;
let height: f64 = 1.80;
```

**[Ejemplo 3](./holamundo-03.rs): probando cosas raras**

¿Qué pasaría si el número de marcas `{}` no coincide con el número de las variables?

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

El compilador lo detecta y nos muestra los errores. El código no compilará hasta que los escribamos de forma correcta.

**[Ejemplo 4](./holamundo-04.rs): Leer del teclado.**

Ahora los valores de las variables los introducirá el usuario por teclado. La función `read_line(&mut name)` lee la entrada de teclado (incluyendo el salto de línea), y lo guarda en la variable `name`. Para quitar el retorno de carro se hace `let name = name.trim();`.

Veamos cómo leemos un entero:

```rust
    let mut age_input = String::new();
    io::stdin()
        .read_line(&mut age_input)
        .expect("Error al leer edad");
    let age: u32 = age_input
        .trim()
        .parse()
        .expect("Por favor, introduce un número");
```

1. Se crea una variable de tipo String: `let mut age_input = String::new();`.
2. Se lee el teclado y se guarda en una variable tipo String: `read_line(&mut age_input)`.
3. Se convierte la entrada String en valor entero (unsigned int de 32 bits): `let age: u32 = age_input.trim.parse()`.

* `std::io`: es un módulo.
* `stdin()`: es una función que devuelve una refencia al struct Stdin.
* `read_line(VARNAME)`: es una función que guarda en VARNAME el contenido leído y devuelve un `io::Result<usize>` con el posible código de error.

Control de errores:

* Las funciones que devuelven un tipo `Result`, pueden terminar bien o pueden devolver un error.
* Rust no usa excepciones para la gestión de errores. Usa tipos `Result`.
* Es necesario comprobar si el `Result` devuelve un error o no. Supongamos que quitamos `.expect()`.

```bash
$ rustc holamundo-04.rs

error[E0308]: mismatched types
  --> holamundo-04.rs:20:20
   |
20 |       let age: u32 = age_input
   |  ______________---___^
   | |              |
   | |              expected due to this
21 | |         .trim()
22 | |         .parse();
   | |________________^ expected `u32`, found `Result<_, _>`
   |
   = note: expected type `u32`
              found enum `Result<_, _>`
help: consider using `Result::expect` to unwrap the `Result<_, _>` value, panicking if the value is a `Result::Err`
   |
22 |         .parse().expect("REASON");
   |                 +++++++++++++++++

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.
```

* La función `expect("REASON")` comprueba el valor devuelto, si el `Result` contiene un error muestra "REASON" por pantalla. Por dentro, `expect()` hace como un "ìf Result Ok entonces valor else muestra mensaje".
* Vamos a ver lo mismo que hace `expect()` pero de un forma más explícita y más larga:

```rust
if let Ok(num) = age_input.trim().parse::<u32>() {
    let age = num;
} else {
    println!("Entrada inválida");
}
```

**[Ejemplo 5](./holamundo-05): Poniendo un poco de color a la vida.**

Para poder colorear el texto en el terminal tenemos que instalar una biblioteca llamada `colored`, pero como hacerlo forma "manual" son muchos pasos vamos a seguir otro camino más corto y más "rustacean". 

Hasta ahora, habíamos creado ficheros individuales y los compilábamos manualmente con `rustc`. Ahora trabajaremos en proyectos. Para gestionar los proyectos de Rust usamos la herramienta `cargo`.

* Crear un nuevo proyecto:

```bash
$ cargo new holamundo-05
```

```
holamundo-05
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs
```

* El fichero `holamundo-05/Cargo.toml` es el fichero de configuración principal del proyecto.
* En la sección `[dependencies]` sólo tenemos que poner el nombre de la biblioteca y su versión: `colored = "2"`. 

```ini
[package]
name = "holamundo-05"
version = "0.1.0"
edition = "2024"

[dependencies]
colored = "2"
```

* Ejecutamos `cargo run`, y se encarga de todo:
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
   Compiling holamundo-05 v0.1.0 (./holamundo-05)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 1.10s
     Running `target/debug/holamundo-05`

Name: Obiwan
Age: 57
Height: 1.80
El personaje OBIWAN, tiene 57 años de edad y mide 1.8 metros.
```

* Para que el código sea un poco más legible hemos creado nuevas variables. Por ejemplo `colored_name` que tiene el mismo contenido de `name` pero incluyendo el color.
* Más información:
    * Sobre `colored`:
        * Página en **crates.io**: https://crates.io/crates/colored
        * Documentación oficial: https://docs.rs/colored/latest/colored/
    * Sobre `String`: https://doc.rust-lang.org/std/string/struct.String.html
    * Sobre otras bibliotecas (`crates`): https://crates.io/.

También (_como buen "rustacean"_) hago lo siguiente:

* `cargo fmt`: para formatear el código según el estilo Rust.
* `cargo clippy`: ejecutar este asistente que me hacer sugenrencias para mejorar.

> A partir de ahora lo haré con todos los proyectos que vaya haciendo.

**[Ejemplo 6](./holamundo-06): Paso de argumentos de entrada. Es lo habitual en comandos y scripts.**

* En esta versión del programa vamos el paso de argumentos por la línea de comandos como forma de introducir los datos.
* Ejemplo de ejecución con "cargo":

```bash
$ cargo run obiwan 57 1.80
   Compiling holamundo-06 v0.1.0 (./holamundo-06)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.10s
     Running `target/debug/holamundo-06 obiwan 57 1.80`
El personaje OBIWAN, tiene 57 años de edad y mide 1.8 metros
```

* Otra forma de ejecutar el programa:

```bash
$ ./target/debug/holamundo-06 Vader 40 1.90
El personaje VADER, tiene 40 años de edad y mide 1.9 metros.
```

Los módulos son contenedores de funciones. En nuestro ejemplo, para leer los argumentos usamos funciones definidas dentro del módulo `std::env`. Este módulo contiene funciones relacionadas en el entorno del proceso. Por ejemplo:

* `env::args()`: Devuelve un iterador con los argumentos de la línea de comandos.
* `env::var()`: Leer variables de entorno.
* `env::current_dir()`: Obtener el directorio de trabajo actual.

> Más información del módulo [std::env](https://doc.rust-lang.org/std/env/index.html)

En la línea `let args: Vec<String> = env::args().collect();` estamos definiendo la variable `args` como un vector de String que contiene todos los argumentos que se han pasado por la línea de comandos. A partir de ahí, el código es similar al ejemplo anterior.

> CURIOSIDAD: Hay que resaltar que el código de este ejemplo tiene menos líneas que el ejemplo anterior.

Cuando vamos a usar nuevas funciones o structs, a veces debemos indicar con `use` el módulo que vamos a utilizar. Como por ejemplo: `use std::env;`. Pero otras veces no es necesario porque ya están incluidas por defecto. Es lo que se llama el Prelude.

El Prelude es el conjunto de elementos (tipos, traits y funciones) que Rust importa por defecto. Incluye elementos de la biblioteca estándar (std), como por ejemplo:

* Tipos de datos básicos: String, Vec, Option<T>, Result<T, E>, Box<T>, Arc<T>, Rc<T>.
* Traits fundamentales: Clone, Copy, Send, Sync, Display, Debug, Iterator, Default, Drop, PartialEq, PartialOrd, etc.
* Funciones y macros: drop, println!, format!, vec!, panic!, assert!.

---
**[Ejemplo 8](./08-holamundo.rb): Cambiamos la lógica para separar metros de centímetros.**

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

