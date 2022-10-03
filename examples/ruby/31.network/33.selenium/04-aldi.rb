#!/usr/bin/env ruby

require_relative "04-aldi-lib"

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
codes = [ "38670", "38550", "38260", "38611", "35014", "35214", "38639" ]

codes.each do |code|
  aldi = Aldi.new(URL)
  aldi.click_button("SALTAR", debug: false)
  aldi.filter(code)
  # aldi.pause if code == "38639"
  if aldi.exist_button? "Continuar"
    puts "    [DEBUG] filtered by #{code} and try Continuar.."
    next
    # aldi.click_button("Continuar")
  end
  aldi.click_link("Mapa", debug: false)
  aldi.click_button("Calcule la ruta:", debug: false)
  puts "    Teléfono: #{aldi.get_telefono.colorize(:green)}"
  aldi.quit
end
