
group "Software Sqlite" do

  version = get(:sqlite_version)
  
  target "Instalar sqlite versión #{version}"
  run "sqlite3 -version"
  expect_one version

  database = get(:database_file)

  target "Crear la base de datos en '#{database}'."
  run "file #{database}"
  expect_one [ database, 'SQLite', '3.x', 'database' ]

end
