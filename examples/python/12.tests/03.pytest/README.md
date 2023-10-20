
# pytest - Tests en Python

> Enlaces de interés
> * [Pytest - Guía rápida](https://isolution.pro/es/t/pytest/pytest-quick-guide/pytest-guia-rapida)
> * [Pytest - buenas prácticas](https://docs.pytest.org/en/latest/explanation/goodpractices.html)

## Instalación

**IMPORTANTE**: No instalar pytest en el sistema real, usar entornos virtuales de Python.

Pasos para crear un entorno virtual de Python para ejecutar los tests de pytest:
```
$ python3.10 -m venv venv
$ source venv/bin/activate
$ pip install -r requirements-venv.txt
```

## Configuración

Recordar que para que funcione `pytest` tenemos que poner ficheros `__init__.py` vacíos en las carpetas `test/*` donde tenemos nuestros tests.

> Consultar el siguiente [enlace](https://es.stackoverflow.com/questions/224979/es-necesario-usar-init-py-para-los-paquetes-en-python-3) para entender un poco mejor la utilidad de los ficheros `__init__.py`.
