```
Test unit name : tarea1sqlite
Date           : 2022-06-26 00:42:25 +0100
Teuton version : 2.3.6
```

# tarea1sqlite

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | HOST1 |  |

> NOTE: SSH Service installation is required on every host.

### Required params
* host1_ip
* host1_password
* host1_username
* id

> NOTE: Save every 'param: value' into config file.

## Software sqlite

Crear MV Debian.

Go to [HOST1](#required-hosts) host, and do next:
* Instalar sqlite versión 3.36.0.
* Crear la base de datos en 'tarea/alumnoID.db'.

## Crear varias sentencias sql dentro de scripts

Crear la carpeta /home/nombre-alumno/tarea.

Dentro de la carpeta anterior crear una base de datos sqlite3 con el nombre 'alumnoXX.db'
(Donde XX es el ID asignado por el profesor a cada alumno)

Go to [HOST1](#required-hosts) host, and do next:
* (x2.0) Crea script SQL en el fichero 'tarea/01.sql'.
.
    * Escribe sentencia SQL para contar el número de registros de la tabla Persons con age mayor o igual a 18
* (x2.0) Crea script SQL en el fichero tarea/02.sql.
    * Escribe sentencia SQL para mostrar el primer name de la tabla Persons ordenada alfabéticamente
