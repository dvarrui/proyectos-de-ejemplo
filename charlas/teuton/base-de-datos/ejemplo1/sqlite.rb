
group "Software Sqlite" do
  readme "Crear MV."

  target "Instalar sqlite versión 3.36.0."
  run "sqlite3 -version", on: :host1
  expect_one "3.36.0"

  database = "tarea/alumno#{get(:id)}.db"
  
  target "Crear la base de datos en '#{database}'."
  run "file #{database}", on: :host1
  expect_one [ database, 'SQLite', '3.x', 'database' ]

end
