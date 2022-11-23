
# Rust lang

> Enlaces de interés:
> * https://www.rust-lang.org/es/

## Instalación

_"If you want to install Rust for a development environment, you should install 'rustup'."_.

Instalación
* `zypper install rustup`, con esta herramienta se instala el entorno de desarrollo de Rust.

Se instala lo siguiente:
* rustc, el compilador
* `cargo run`, sirve para compilar y ejecutar programas.

Comprobamos:
```
> cargo version
cargo 1.60.0 (d1fd9fe 2022-03-01)

> rustc --version
rustc 1.60.0 (7737e0b5c 2022-04-04)
```


# Features

Basic types
* Scalar types: integer, float, boolean and char.
* Compound types:
    * tuple (fixed length)
    * array (fixed length, same type elements)

Conceptos:
* In Rust, variables are immutable by default.
* types vs variant
* methods vs functions vs macros
* traits
* statement: execute actions
* expression: return value
* function: expression compound by group of statements

# Pendiente

* Ejemplo con crate ferrysay: https://docs.rs/ferris-says/0.1.1/ferris_says/fn.say.html
* Dependencias en: https://crates.io/
