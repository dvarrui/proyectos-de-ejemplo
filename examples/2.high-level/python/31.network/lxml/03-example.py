#!/usr/bin/env python
from lxml import html

content = """
<html>
  <header>Esto es el header</header>
  <body>
    <h1>Este es el body</h1>
    <div id="obiwan" class="caballero jedi">Obiwan Kenobi
      <div>Caballero Jedi</div>
    </div>
    <div class="droides">
      <p>R2D2</p>
      <p>C3PO</p>
    </div>
    <p>Ejemplo de Nokogiri</p>
  </body>
</html>
"""

tree = html.fromstring(content)

print("==> Localizar div por texto usando XPATH")
elements = tree.xpath("//div[contains(text(),'Jedi')]")
for element in elements:
  print("ITEM:", element.text)
