
Enlace de interés:
* https://geekflare.com/es/python-pyproject-toml/


Instalar la herramienta para crear paquetes de Python
* python -m pip install build
* zypper install python311-build

Creamos el código de nuestro paquete

Crear el fichero de configuración pyproyect.toml

Crear nuestro paquete
* python3 -m build

Se crean los siguientes ficheros:
```
├── dist
│   ├── demo-0.0.1-py3-none-any.whl
│   └── demo-0.0.1.tar.gz
```

Para instalar nuestro paquete desde local
* PATH/TO/venv/bin/pip install dist/demo-0.0.1.tar.gz

Confirmamos:
PATH/TO/venv/bin/pip list

Para ejecutar el script principal:
* demo

Para desinstalar el paquete:
PATH/TO/venv/bin/pip uninstall demo
PATH/TO/venv/bin/pip list
