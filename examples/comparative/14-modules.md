[<< back](README.md)

# Modules

_¡Divide y venceras!_

El código fuente de un programa se divide en ficheros más pequeños a medida que aumenta su complejidad, para hacerlo más manejable para los humanos.

* `include` se usa en C.
* `import` se usa en Python y Java
* `require` y `require_relative` en Ruby
* etc.

Sin embargo, los comportamientos no son iguales.

## Un nivel

Supongamos que tenemos la siguiente organización de ficheros de Python.

```
├── greet.py
└── main.py
```

En este caso, para poder acceder al contenido de `greet` desde `main` haremos algo como `from greet import *`. Es algo como, "cóge todo desde greet".

En un ejemplo similar con Ruby, tendríamos `require_relative "greet"`.

```
├── greet.rb
└── main.rb
```

## Dos niveles

Ahora vamos a partir de un proyecto Python con carpetas:

```
.
├── lib
│   ├── greet.py
│   └── hi.py
├── main.py
└── saludar.py
```
