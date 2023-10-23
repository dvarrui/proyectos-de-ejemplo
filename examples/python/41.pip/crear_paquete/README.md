
# Crear un paquete Python

Supongamos que tenemos el siguiente proyecto:

```
proyecto
├── helloworld
│   ├── es
│   │   ├── __init__.py
│   │   └── saludar.py
│   ├── __init__.py
│   └── hello.py
└── setup.py
```

## Ficheros __init__.py

Dentro de cada carpeta del código fuente del módulo, tenemos que tener un fichero `__init__.py`, donde se definen los nombres de los métodos de los archivos del directorio donde esté ubicado.

Por ejemplo:
* El fichero `helloworld/es/__init__.py` tendrá:
```python
from helloworld.es.saludar import saludar
```
* El fichero `helloworld/__init__.py` tendrá:
```python
from helloworld.hello import hello
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
