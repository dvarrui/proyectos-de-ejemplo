dinero = ARGV[0].to_i

puts('Para el importe solicitado tienes: ')

monedas = [100, 50, 20, 10, 5, 2, 1]

monedas.each do |moneda|
  if  (dinero/moneda) >= 1
    if moneda > 2
      puts "* #{ dinero / moneda} billete de #{moneda.to_s} euros"
    else
      puts "* #{ dinero / moneda} monedas de #{moneda.to_s} euros"
    end
    dinero = dinero % moneda
  end
end
