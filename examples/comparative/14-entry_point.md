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

# Conclusión

Punto de entrada:
* En Python es importante definir el "punto de entrada". Esto es, el fichero que inicia la ejecución.
* En Ruby cualquier fichero puede ser punto de entrada.

| Referencia                   | Python                      | Ruby |
| ---------------------------- | --------------------------- | ----------------- |
| Bibliotecas instaladas       | import LIBNAME              | require "LIBNAME" |
| Absoluta al punto de entrada | from PATH.TO.FILE import *  | No existe punto de entrada |
| Relativa al fichero          | from .PATH.TO.FILE import * | require_relative "FILE" |
