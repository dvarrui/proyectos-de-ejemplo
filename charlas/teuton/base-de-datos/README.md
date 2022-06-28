# Ejemplo: teuton con base de datos

# Preparativos

Vamos a preparar nuestra práctica. Podemos empezar creando una MV y haciendo la práctica primero
nosotros mismos para asegurarnos de que lo tenemos todo bajo control. Si ya lo tenemos controlado...
podemos saltar en siguiente punto.

> Enlace de interés:
> *https://www.tutorialspoint.com/sqlite/sqlite_commands.htm

1. Creamos la MV snode1 usando [vagrant/snode.1/Vagrantfile](vagrant/snode.1/Vagrantfile).
2. Instalar sqlite3: `zypper in sqlite`. Comprobamos `sqlite3 -version`.
3. Creamos la base de datos
```bash
> sqlite3
sqlite3> .databases
main: /home/vagrant/tarea/alumno01 r/w
```
4. Crear tabla: `create table Persons (name varchar(255), age int);`
5. Llenar con datos
```
insert into Persons (name, age) values ( "Obiwan", 56);
insert into Persons (name, age) values ( "Princesa", 10);
insert into Persons (name, age) values ( "Luke", 10);
insert into Persons (name, age) values ( "Yoda", 980);

select * from Persons
select name from Persons order by name;
```

/tarea> file alumno01.db 
alumno01.db: SQLite 3.x database, last written using SQLite version 3036000


6. Fichero `/home/alumno/tarea/01.sql` con `select count(name) from persons where age >= 18;`

sqlite3 tarea/alumno01 ".read tarea/01.sql"
2

7. Fichero `/home/alumno/tarea/02.sql` con `select name from Persons order by name;`

select name from Persons order by name limit 1;
Luke

sqlite3 tarea/alumno01 ".read tarea/02.sql"

# Crear el Test de Teuton

> Enlaces de interés:
> *https://database.guide/5-ways-to-run-sql-script-from-file-sqlite/

1. `teuton new tarea1`, creamos "esqueleto" para un nuevo test.
1. En en fichero [tarea1/start.rb](tarea1/start.rb) definimos los objetivos de la práctica.
1. En el fichero [tarea1/config.yaml](tarea1/config.yaml) configuramos los parámetros (acceso a las máquinas, etc.) de cada alumno (case).
1. `teuton tarea1sqlite`, para ejecutar el test.

Ver resultados en [var/tarea1](var/tarea1)

# Crear enunciado

Podemos usar el comando teuton para crear un enunciado a partir de la propia tarea (Test de teuton).
* `teuton readme tarea1 > tarea1/README.md`

