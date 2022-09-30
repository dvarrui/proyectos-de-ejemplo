#!/usr/bin/env ruby

require_relative "04-aldi-lib"

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
CODE = "38260"

aldi = Aldi.new(URL)
aldi.click_button("SALTAR")
aldi.filter(CODE)
aldi.click_link("Mapa")
aldi.click_button("Calcule la ruta:")
aldi.pause
aldi.quit
