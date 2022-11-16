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
├── saludar.py
└── main.py
```

En este caso, para poder acceder al contenido de `saludar` desde `main` haremos algo como `from saludar import *`. Es algo como, "cóge todo desde greet".

En un ejemplo similar con Ruby, tendríamos `require_relative "saludar"`.

```
├── saludar.rb
└── main.rb
```

## Dos niveles

Ahora vamos a partir de un proyecto Python con carpetas:

```
├── lib
│   ├── greet.py
│   └── hi.py
├── main.py
└── saludar.py
```

Para poder acceder desde `main` hay que poner la ruta completa desde `main` en el `import`. Ejemplo:

```python
# File: main.py
from lib.greet import *
```

El mismo ejemplo en Ruby:

```
├── lib
│   ├── greet.rb
│   └── hi.rb
├── main.rb
└── saludar.rb
```

```ruby
# File: main.rb
require_relative "lib/greet"
```

## Punto de entrada, trayectoria absoluta y relativa

Hasta aquí, todo parecido.

Supongamos que en el ejemplo anterior (con subdirectorios) queremos acceder al fichero `hi` desde `greet`. Ambos están en el mismo nivel o subcarpeta. Veamos ejemplo en Ruby:

```ruby
# File: lib/greet.rb
require_relative "hi"
```

Esto es, como `greet` y `hi` están en la misma carpeta, se usa **trayectoria relativa** para llegar de uno a otro.

En Python, la respuesta depende del "punto de entrada" o cómo se inicie la ejecución del proyecto. Por ejemplo si se ejecuta directamente el fichero `lib/greet.py` entonces para acceder a `lib/hi.py` sería igual que en Ruby:

```python
# File: lib/greet.py
from hi import *
```

Pero si el "punto de entrada" es el fichero `main.py`, entonces el fichero `lib/greet.py` debe hacer otra referencia para acceder a `lib/hi.py`.

Usando trayecto absoluta desde el "punto de entrada":

```python
# File: lib/greet.py
from lib.hi import *
```

Usando trayectoria relativa:
```
# File: lib/greet.py
from .hi import *
```

## Niveles superiores

* En Python no se puede acceder o referenciar a ficheros que estén un nivel superior del "punto de entrada".
* El punto de entrada en Python establece un límite de los ficheros que serán accesibles a nuestro proyecto.
* En Ruby, no existe esa limitación/restricción.

_¿Tiene sentido? ¿Es útil esa restricción para mantener un orden o tener el proyecto bien organizado?_

## Nombres

Supongamos el siguiente proyecto Python:

```
├── main.py
├── name
│   └── rename.py
└── name.py
```

En el main ponemos `from name import *` para usar el fichero `name,py`. Si ahora además queremos usar el fichero `name/rename.py` y hacemos `from name.rename import` tenemos un error `ModuleNotFoundError: No module named 'name.rename'; 'name' is not a package`.

No podemos tener un fichero NAME.py y una carpeta NAME en el mismo nivel.

En Ruby, ¡si se puede!

# Conclusiones

Python:
* Es importante definir el "punto de entrada". Esto es, el fichero que inicia la ejecución.
* Sólo se puede acceder a los ficheros dentro del proyecto, y a las bibliotecas instaladas en el sistema.
* Los nombres de ficheros no deben coincidir con los nombres de carpetas.

Ruby:
* Cualquier fichero puede ser punto de entrada.
* Los nombres de ficheros y carpetas pueden repetirse.
* Se puede acceder a cualquier fichero dentro o fuera del proyecto, y a las bibliotecas instaladas en el sistema.

| Referencia                   | Python                      | Ruby |
| ---------------------------- | --------------------------- | ----------------- |
| Bibliotecas instaladas       | import LIBNAME              | require "LIBNAME" |
| Absoluta al punto de entrada | from PATH.TO.FILE import *  | No existe punto de entrada |
| Relativa al fichero          | from .PATH.TO.FILE import * | require_relative "FILE" |

Son dos formas diferentes de trabajar que emanan de dos filosofías diferentes. En el Zen d Python se dice _"debería haber preferentemente una única forma de hacer las cosas"_, y realmente el diseño de su lenguaje debe estar alineado en esta dirección.

Podemos ver que cada lenguaje tiene sus propios principios, que pueden coincidir en parte con los de otros lenguajes. Podríamos discutir sobre esos principios, pero ahora no es el tema. Lo que quiero recalcar ahora es que un lenguaje cuyo diseño está alineado con sus principios... está bien diseñado.

Entiendo que el creador de un nuevo lenguaje parte de unos principios, luego diseña su lenguaje para satisfacer esa necesidad pero si el resultado no cumple el objetivo habrá que rehacer el lenguaje o... cambiar los principios: ;-)
