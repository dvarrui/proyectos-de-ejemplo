
group "Crear varias sentencias SQL dentro de scripts" do
  readme "Crear la carpeta /home/nombre-alumno/tarea.\n"
  readme "Dentro de la carpeta anterior crear una base de datos sqlite3 con el nombre 'alumnoXX.db'"
  readme "(Donde XX es el ID asignado por el profesor a cada alumno)"

  id = get(:id)
  database = "tarea/alumno#{id}.db"
  cmd = "sqlite3 #{database}"

  target "Crea script SQL en el fichero 'tarea/01.sql'.\n", weight: 2
  readme "Escribe sentencia SQL para contar el número de registros de la tabla Persons con age mayor o igual a 18"
  run "#{cmd} '.read tarea/01.sql'", on:  :host1
  expect_one "2"

  target "Crea script SQL en el fichero tarea/02.sql", weight: 2
  readme "Escribe sentencia SQL para mostrar el primer name de la tabla Persons ordenada alfabéticamente"
  run "#{cmd} '.read tarea/02.sql'", on: :host1
  expect_one "Luke"
end
