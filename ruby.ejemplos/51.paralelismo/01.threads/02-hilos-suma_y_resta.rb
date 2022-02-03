#!/usr/bin/ruby
#

x = 0
max = 10
inc = 2
dec = -1

# Hilo para decrementar
Thread.new do
  while x > (max * -1)
    x += dec
    puts "DEC[#{dec}]: Disminuyendo la x a #{x}\n"
    sleep(0.1)
  end
  puts "DEC[#{dec}]: x=#{x} Es muy pequeña. Gané!"
  exit 1
end

# Hilo para incrementar
while x < (max)
  x += inc
  puts "INC[#{inc}]: Aumentando a x a #{x}\n"
  sleep(0.3)
end

exit 0
