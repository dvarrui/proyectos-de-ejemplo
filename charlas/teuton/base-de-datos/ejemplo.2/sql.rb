
group "Crear consultas SQL dentro de ficheros" do

  database = get(:database_file)

  target "Crea script SQL en el fichero 'files/01.sql'.\n"
  readme "Consulta SQL para averiguar el número de 'persons' con 'age' mayor o igual a 18"
  run "sqlite3 #{database} '.read files/01.sql'", on: :host1
  expect_one "2"

  target "Crea script SQL en el fichero tarea/02.sql"
  readme "Encontrar el primer 'name' de 'persons' alfabéticamente."
  run "sqlite3 #{database} '.read files/02.sql'", on: :host1
  expect_one "Luke"
end
