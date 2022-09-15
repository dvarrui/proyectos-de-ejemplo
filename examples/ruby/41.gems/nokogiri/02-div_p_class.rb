#!/usr/bin/env ruby

require "nokogiri"

html = <<EOF
<html>
  <header>Esto es el header</header>
  <body>
    <h1>Este es el body</h1>
    <div id="obiwan" class="jedi">Obiwan Kenobi</div>
    <div>
      <p>R2D2</p>
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
doc.css("div p").each { puts "p.text = #{_1.text}" }

puts "\n=== Localizar class ==="
items = doc.css("div")
puts items.select { |i| i["class"] == "jedi" }

