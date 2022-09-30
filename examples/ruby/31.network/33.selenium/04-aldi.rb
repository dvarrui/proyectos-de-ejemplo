#!/usr/bin/env ruby

require_relative "04-aldi-lib"

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
codes = [ "38670", "38550", "38639" ]

codes.each do |code|
  aldi = Aldi.new(URL)
  aldi.click_button("SALTAR")
  aldi.filter(code)
  # aldi.pause if code == "38639"
  aldi.click_button("Continuar") if aldi.exist_button? "Continuar"

  aldi.click_link("Mapa")
  aldi.click_button("Calcule la ruta:")
  puts aldi.get_telefono
  aldi.quit
end
