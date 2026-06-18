cantidad = ARGV[0].to_i || 0

puts("Realizando el cambio para #{cantidad} euros...")

monedas =[ 100, 50, 20, 10, 5, 2, 1]

monedas.each do |moneda|
  if (cantidad/moneda) >=1
    soporte = 'billete' if moneda >= 5
    soporte = 'moneda' if moneda < 5
    plural = ''
    plural = 's' if (cantidad/moneda) > 1
    puts "* #{ cantidad / moneda} #{soporte}#{plural} de #{moneda} euros"
    cantidad = cantidad % moneda
  end
end
