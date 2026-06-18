
# dinero = ARGV[0].to_i
dinero = 54

IO.puts('Para el importe solicitado tienes: ')

if  div(dinero,100) >= 1 do
  IO.puts "#{ div(dinero,100) } billete/s de 100 euros"
  dinero = rem(dinero,100)
end

if dinero / 50 >= 1 do
  IO.puts "#{ (dinero / 50) } billete/s de 50 euros"
  dinero = rem(dinero, 50)
end

if  dinero / 20 >= 1 do
  IO.puts "#{dinero / 20} billete/s de 20 euros"
  dinero = rem(dinero, 20)
end

if dinero / 10 >= 1 do
  IO.puts "#{ (dinero / 10) } billete/s de 10 euros"
  dinero = rem(dinero, 10)
end

if  dinero / 5 >= 1 do
  IO.puts "#{ dinero / 5 } billete/s de 5 euros"
  dinero = rem(dinero, 5)
end

if  dinero / 2 >= 1 do
  IO.puts "#{ (dinero / 2) } moneda/s de 2 euros"
  dinero = rem(dinero, 2)
end

if  dinero / 1 >= 1 do
  IO.puts "#{dinero / 1} moneda/s de 1 euro"
  dinero = rem(dinero, 1)
end
