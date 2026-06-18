#!/usr/bin/ruby
# Salvar como guess.rb
# Los Strings se escriben con " y es un error usar '
words = ["ruby", "java", "c++"] 
secret = words[rand(3)]
print "adivina un lenguaje de programación? "

while guess = STDIN.gets
  # Este método no existe en los Strings. Se ve que \n no se pasa al String
  # guess.chop! 
  if guess == secret
      print "¡Ganas!\n"
      break
  else 
      if guess > secret
          print "La palabra es menor que #{guess}\n"
      else
          print "La palabra es mayor que #{guess}\n"
      end
  end
  print "adivina? "
end
print "La palabra era ", secret, ".\n"

