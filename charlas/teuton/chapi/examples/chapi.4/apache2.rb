
group "Servidor Web Apache2" do
  target 'Apache2 running'
  goto :host1, :exec => 'systemctl status apache2'
  expect result.grep('active (running)').count.equal(1)

  target 'Exist index.html file'
  goto :host1, :exec => 'cat /srv/www/htdocs/index.html'
  expect result.grep('Hola TEUTON!').count.equal(1)
end

