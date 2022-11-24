
# Making Ruby Gem with Rust

* Magnus: https://crates.io/crates/magnus
* https://dev.to/kojix2/making-rubygem-with-rust-2ji6. Writing Ruby extensions in C is a popular way to speed up Ruby. A few days ago on Reddit, I read a po...


# 1. Llamando a Rust desde Ruby

_Vamos a escribir una extensión de una gema Ruby para llamar a Rust desde Ruby._

## 1.1 Esqueleto del proyecto

Vamos a crear un proyecto de gema Ruby y dentro pondremos el código de Rust.
* `bundle gem example`
* `mkdir example/ext`, carpeta para las extensiones de la gema.

## 1.2 Proyecto Rust

* `cd example/ext`, nos movemos a la carpeta de las extensiones.
* `cargo new example`, creamos un nuevo paquete de Rust.
* Modificamos el fichero de configuración del paquete Rust (`Cargo.toml`)

```
[lib]
crate-type = ["cdylib"]

[dependencies]
magnus = "0.4"
```

> NOTA:
> * Las extensiones de Ruby deben construirse como bibliotecas de sistemas dinámicos, esto se hace con el atributo `crate-type`.
> * Además vamos a usar la biblioteca (crate) `magnus` dentro de nuestro proyecto Rust para conectar Rust con Ruby.

* Creamos el fichero **src/lib.rs** con el siguiente contenido:

```rust
use magnus::{define_global_function, function};

fn distance(a: (f64, f64), b: (f64, f64)) -> f64 {
    ((b.0 - a.0).powi(2) + (b.1 - a.1).powi(2)).sqrt()
}

#[magnus::init]
fn init() {
    define_global_function("distance", function!(distance, 2));
}
```

> Código fuente de la función Rust:
> * Usaremos el atributo `#[magnus::init]` para marcar su función de inicio para que pueda exponerse correctamente a Ruby.
> * En esta función, se definen las clases de Ruby y se vinculan las funciones de Rust a los métodos de Ruby.
> * Más tarde Ruby llamará a la función 'init' definida en su extensión.

## 1.2 Gema Ruby

Para empaquetar la extensión en una gema, vamos a usar `rb_sys` y `rake-compiler`. Estas herramientas crearán automáticamente su extensión Rust como una biblioteca dinámica y luego la empaquetarán como una gema.

> Nota: La versión más reciente de `rubygems` tiene soporte beta para compilar Rust, por lo que en el futuro la gema `rb_sys` no será necesaria.

* Modificamos el fichero `example.gemspec` para incluir información de la extensión:

```ruby
spec.extensions = ["ext/example/extconf.rb"]

# needed until rubygems supports Rust support is out of beta
spec.add_dependency "rb_sys", "~> 0.9.39"

# only needed when developing or packaging your gem
spec.add_development_dependency "rake-compiler", "~> 1.2.0"
```

* Creamos el fichero `ext/example/extconf.rb`.

```ruby
require "mkmf"
require "rb_sys/mkmf"

create_rust_makefile("example/example")
```

> Ruby usará este archivo durante el proceso de compilación y generará un Makefile en el directorio ext. Consulte la gema `rb_sys` para obtener más información.


Consulte el ejemplo `rust_blank` para ver ejemplos de `extconf.rb` y `Rakefile`.

Ejecutar `rake` compile colocará la extensión en `lib/example/example.so` (o .bundle en macOS), que cargarías desde Ruby así:

* Modificar el fichero `lib/example.rb`.

```ruby
require_relative "example/example"
```

For a more detailed example (including cross-compilation and more), see the rb-sys example project. Although the code in lib.rs does not feature magnus, but it will compile and run properly.
