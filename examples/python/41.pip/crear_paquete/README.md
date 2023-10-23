
# Crear un paquete Python

Supongamos que tenemos el siguiente proyecto:

```
proyecto
├── modulo
│   ├── extra
│   │   ├── __init__.py
│   │   ├── dividir.py
│   │   └── multiplicar.py
│   ├── __init__.py
│   ├── restar.py
│   └── sumar.py
└── setup.py
```

## Ficheros __init__.py

Dentro de cada carpeta del código fuente del módulo, tenemos que tener un fichero `__init__.py`, donde se definen los nombres de los métodos de los archivos del directorio donde esté ubicado.

Por ejemplo:
* El fichero `modulo/extra/__init__.py` tendrá:
```python
from dividir import dir
from multiplicar import mul
```
* El fichero `modulo/__init__.py` tendrá:
```python
from restar import res
from sumar import sum
```

## Fichero setup.py

En la raíz del proyecto tendremos un fichero `setup.py` con definiciones de nuestro módulo que usaremos para crear el paquete.

```python
from setuptools import setup, find_packages
...
```

## Crear el paquete

* Ejecutamos `python setup.py sdist bdist_wheel` para crear el paquete.
* Necesitaremos tener una cuenta en PyPi para poder subir nuestro paquete al repositorio.
* `pip install twine`, instalamos el paquete `twine`.
* `twine upload dist/*`, para subir el paquete al repositorio.
