[<<back](README.md)

# Native gems (part3)

> Part 3 - How do we ensure that we have everything and that it actually gets built at installation? https://notepad.onghu.com/2023/learning-by-reversing-s1-e3-native-gems/

_Continuamos viendo cómo empaquetamos y nos aseguramos de que la extensión nativa se construya realmente durante la instalación. Además, ¿por qué hay 2 Makefiles?_

La parte 3 continúa la exploración de lo que incluye la gema y cómo se configura para que la extensión nativa se construya y esté disponible una vez que se instale la gema.

## ¿Qué hay dentro de la gema?

Cada fichero debe estar en su lugar:
* El código principal de la gema de Ruby en `lib`: es el lugar normal para incluir el archivo principal.
* La biblioteca dinámica en `lib/fast_polylines` como `fast_polylines.so` - espera, ¡esto no existía cuando vimos el código fuente!

Esto es lo que tenemos que hacer ahora: debemos pasar el código fuente C a una biblioteca dinámica en `lib/fast_polylines/fast_polylines.so`. Esto funciona así:

* Configuramos algunas cosas en el código fuente
* Lo empaquetamos como parte de nuestra gema.
* La extensión nativa se crea cuando se instala la gema (y todo debería estar en el lugar correcto en ese momento)

## Configurando cosas en el código fuente

```
❯ tree
.
├── CHANGELOG.md
├── ext
│   └── fast_polylines
│       ├── extconf.rb
│       ├── fast_polylines.c
│       ├── fast_polylines.o
│       ├── fast_polylines.so
│       └── Makefile
├── fast-polylines-2.2.2.dev.gem
├── fast-polylines.gemspec
├── Gemfile
├── Gemfile.lock
├── lib
│   ├── fast_polylines
│   │   └── version.rb
│   ├── fast-polylines.rb
│   └── fast_polylines.rb
├── LICENSE
├── Makefile
├── perf
│   └── benchmark.rb
├── README.md
└── spec
    ├── fast-polylines_spec.rb
    ├── fast_polylines_spec.rb
    └── spec_helper.rb

7 directories, 20 files

```

Se pueden ver los archivos Ruby en la carpeta lib.
Para el código nativo, hay dos partes para configurar:
* Asegúrese de que el código fuente C esté disponible
* Tener un `Makefile` que se usará cuando se instale la gema

**Código fuente C**

La gema fast_polylines es sencilla. Solo tiene un archivo de código fuente C. Los archivos fuente nativos se coloquen en el directorio ext del código fuente.
* `fast_polylines.c`: Contiene todo el código fuente C.
* `extconf.rb`: Al ejecutarlo se crea el `Makefile`.

**Makefile**

```
require "mkmf"

if ENV["DEBUG"]
  warn "DEBUG MODE."
  $CFLAGS << " " << %w(
    -Wall
    -ggdb
    -DDEBUG
    -pedantic
  ) * " "
end
create_makefile "fast_polylines/fast_polylines"
```

----

Future posts are planned to go into details like:
* The interface between Ruby and C
* The Development Makefile and a Makefile that also works on Windows
* Running the specs and the performance benchmark
* Enhancements:
- Providing an executable
- A gem that also works on JRuby
- Making the gem ractor friendly
- Patching an existing gem rather than a new module
