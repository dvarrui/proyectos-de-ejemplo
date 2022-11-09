
```
DEVEL
```

Recuerdo la primera vez que supe de la exitencia de las bibliotecas/herramientas para hacer tests. Fue con JUnit de Java, allá por el 2005... ¡Me quedé maravillado! Me gustó la idea desde el principio.

> Creo que los test con básicos para programar

Python y Ruby tienen diversas bibliotecas/herramientas para facilitarnos la creación de los tests. Veamos algunos ejemplos.

## pytest

* Pytest hay que instalarlo con `pip install pytest`.
* Busca los ficheros `test_*.py` o `*_test.py` en el directorio actual y subdirectorios.
* Los nombres de las funciones deben empezar por `test_*`. 

En la documentación de Pytest se menciona el uso de "funciones" para incluir el detalle de los test.

# test/unit

* Esta biblioteca viene por defecto con Ruby.
* Busca los ficheros `*_test.rb` en la carpeta `test` del proyecto.
* Los métodos se deben llamar `test_*`

En Ruby se usan "métodos" para incluir el detalle de los test.

> No es lo mismo una "función" que un "método".

