
# Preparativos

1. Creo MV snode1 usando Vagrant
2. Instalo sqlite3: zypper in sqlite, sqlite3 -version
3. Crear base de datos

> Enlace de interés:
> *https://www.tutorialspoint.com/sqlite/sqlite_commands.htm

 .databases
main: /home/vagrant/tarea/alumno01 r/w

4. Crear tabla
create table Persons (name varchar(255), age int);

5. Llenar con datos
insert into Persons (name, age) values ( "Obiwan", 56);
insert into Persons (name, age) values ( "Princesa", 10);
insert into Persons (name, age) values ( "Luke", 10);
insert into Persons (name, age) values ( "Yoda", 980);

select * from Persons
select name from Persons order by name;

/tarea> file alumno01 
alumno01: SQLite 3.x database, last written using SQLite version 3036000


6. /home/alumno/tarea/01.sql
select count(name) from persons where age >= 18;

sqlite3 tarea/alumno01 ".read tarea/01.sql"
2

7. /home/alumno/tarea/02.sql
select name from Persons order by name;
select name from Persons order by name limit 1;
Luke

sqlite3 tarea/alumno01 ".read tarea/02.sql"

