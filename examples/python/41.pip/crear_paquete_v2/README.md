
Enlace de interés:
* https://geekflare.com/es/python-pyproject-toml/


Instalar la herramienta para crear paquetes de Python
* Activar entorno virtual
* pip install build

> Sólo para la máquina real OpenSUSE: zypper install python311-build

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
* pip install dist/demo-0.0.1.tar.gz

Confirmamos:
pip list

Para ejecutar el script principal:
* demo

Para desinstalar el paquete:
pip uninstall demo
pip list
