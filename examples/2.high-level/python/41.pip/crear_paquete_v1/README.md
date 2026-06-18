
# Crear un paquete Python

> Enlaces de interés:
> * [Cómo construir tu primer paquete de Python](https://www.freecodecamp.org/espanol/news/como-construir-tu-primer-paquete-de-python/)
> * [How to Create a Wheel file for your Python package and import it in another project](https://www.realpythonproject.com/how-to-create-a-wheel-file-for-your-python-package-and-import-it-in-another-project/)

Supongamos que tenemos el siguiente proyecto `helloworld`:

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

> Es importante elegir bien el nombre del paquete para prevenir un error de nombre repetido cuando lo subamos al repositorio PyPi en el paso final.

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

* Crear un fichero [setup.py](setup.py) en la raíz del proyecto, con la configuración de nuestro módulo.
* Este ejemplo tiene la configuración mínima.
* `python setup.py --help` para consultar las opciones disponibles.
* `python setup.py install`, construye el paquete y lo instala en el equipo local.
* `pip show helloworld` para comprobar que tenemos el paquete instalado.

## Publicar el paquete

* Necesitaremos tener una cuenta en PyPi para poder subir nuestro paquete al repositorio.
* `python setup.py sdist bdist_wheel --universal`, crear el paquete en formato (Wheel) para distribuir. En el directorio `/dist` tenemos el fichero `.whl`y el `.tar.gz`.

> Podríamos instalar el paquete en local a partor del fichero Wheel con `pip install dist/helloworld-0.0.1-py2.py3-none-any.whl`. Pero ahora lo que queremos es subir el paquete al repositorio PyPi.

* `pip install twine`, instalamos el paquete `twine`.
* `twine upload dist/*`, para subir el paquete al repositorio.
