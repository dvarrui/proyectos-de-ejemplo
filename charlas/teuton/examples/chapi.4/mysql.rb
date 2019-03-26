
group "Base de datos MySQL" do
  target 'MySQL running'
  goto :host1, :exec => 'systemctl status mysql'
  expect result.grep('active (running)').count.equal(1)

  target 'Exist table <aficiones>'
  goto :host1, :exec => 'mysql chapi -u root -e "desc aficiones;"'
  expect result.grep('nombre').grep('varchar(20)').count.equal(1)

  target 'Registros dentro de la tabla <aficiones>'
  goto :host1, :exec => 'mysql chapi -u root -e "select count(*) from aficiones;"'
  expect result.grep('3').count.equal(1)

  target 'Baloncesto dentro de la tabla <aficiones>'
  goto :host1, :exec => 'mysql chapi -u root -e "select * from aficiones;"'
  expect result.grep('Baloncesto').count.equal(1)
end

