
group "Software Sqlite" do

  target "Instalar sqlite versión 3.36.0."
  run "sqlite3 -version"
  expect_one "3.38"

  database = "files/persons.db"
  
  target "Crear la base de datos en '#{database}'."
  run "file #{database}"
  expect_one [ database, 'SQLite', '3.x', 'database' ]

end
