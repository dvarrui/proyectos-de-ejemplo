
room(:main) do
  puts "Estás en una habitación a oscuras."
  puts "Ves una puerta sucia al fondo."
  puts "A tus pies hay un objeto que parece una linterna."

  actions = ['p', 'c']
  option = ""
  while not actions.include? option do
    puts ""
    puts "(p) Salir poe la puerta"
    puts "(c) Coger la linterna"
    print "¿Qué eliges? "
    option = gets.chomp
  end
  next_state(option)
end
