#!/usr/bin/env ruby

require "nokogiri"

html = <<EOF
<html>
  <header>Esto es el header</header>
  <body>
    <h1>Este es el body</h1>
    <div id="obiwan" class="caballero jedi">Obiwan Kenobi</div>
    <div class="droides">
      <p>R2D2</p>
      <p>C3PO</p>
    </div>
    <p>Ejemplo de Nokogiri</p>
  </body>
</html>
EOF

doc = Nokogiri::HTML.parse(html)

puts "\n==> Localizar class:droides"
puts doc.css(".droides")

puts "\n==> Localizar class:caballero jedi"
puts doc.css(".caballero.jedi")

