```
Test unit name : ejemplo.2
Date           : 2022-06-29 11:22:25 +0100
Teuton version : 2.3.6
```

# ejemplo.2

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | HOST1 |  |

> NOTE: SSH Service installation is required on every host.

### Required params
* database_file
* host1_ip
* host1_password
* host1_username

> NOTE: Save every 'param: value' into config file.

## Crear consultas sql dentro de ficheros


Go to [HOST1](#required-hosts) host, and do next:
* Crea script SQL en el fichero 'files/01.sql'.
.
    * Consulta SQL para averiguar el número de 'persons' con 'age' mayor o igual a 18
* Crea script SQL en el fichero tarea/02.sql.
    * Encontrar el primer 'name' de 'persons' alfabéticamente.
