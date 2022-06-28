
group "Crear varias sentencias SQL dentro de scripts" do

  cmd = "sqlite3 files/persons.db"

  target "Crea script SQL en el fichero 'files/01.sql'.\n", weight: 2
  run "#{cmd} '.read files/01.sql'"
  expect_one "2"

  target "Crea script SQL en el fichero tarea/02.sql", weight: 2
  run "#{cmd} '.read files/02.sql'"
  expect_one "Luke"
end
