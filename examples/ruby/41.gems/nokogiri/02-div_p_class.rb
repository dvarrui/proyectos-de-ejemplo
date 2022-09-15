#!/usr/bin/env ruby

require "nokogiri"

html = <<EOF
<html>
  <header>Esto es el header</header>
  <body>
    <h1>Este es el body</h1>
    <div id="obiwan">Obiwan Kenobi</div>
    <div class="droides">
      <p>R2D2</p>
      <p>C3PO</p>
    </div>
    <p>Ejemplo de Nokogiri</p>
  </body>
</html>
EOF

doc = Nokogiri::HTML.parse(html)

puts "=== Todas las etiquetas div ==="
puts doc.css("div")

puts "\n=== Todas las etiquetas div p ==="
puts doc.css("div p")

puts "\n=== Texto de las etiquetas div p ==="
doc.css("div p").each { puts "p.text = #{_1.text}" }

puts "\n=== Localizar div id obiwan ==="
items = doc.css("div")
puts items.select { |i| i["id"] == "obiwan" }

puts "\n=== Localizar div class droides ==="
items = doc.css("div")
puts items.select { |i| i["class"] == "droides" }

