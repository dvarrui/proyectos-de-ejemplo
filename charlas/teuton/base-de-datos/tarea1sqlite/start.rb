
group "Sqlite" do
  target "Instalar sqlite versión 3.36.0"
  run "sqlite3 -version", on: :host1
  expect_one "3.36.0"
end

group "Tareas SQL" do
  readme "Crear la carpeta /home/nombre-alumno/tarea"
  readme "Dentro de la carpeta anterior crear una base de datos sqlite3 con el nombre 'alumnoXX.db'"
  readme "(Donde XX es el ID asignado por el profesor a cada alumno)"

  id = get(:id)
  database = "tarea/alumno#{id}.db"

  target "Crea script SQL en el fichero tarea/01.sql"
  readme "Escribe sentencia SQL para contar el número de registros de la tabla Persons con age mayor o igual a 18"
  run "sqlite3 #{database} '.read tarea/01.sql'", on:  :host1
  expect_one "2"

  target "Crea script SQL en el fichero tarea/02.sql"
  readme "Escribe sentencia SQL para mostrar el primer name de la tabla Persons ordenada alfabéticamente"
  run "sqlite3 #{database} '.read tarea/02.sql'", on: :host1
  expect_one "Luke"
end

play do
  show
  export
end
