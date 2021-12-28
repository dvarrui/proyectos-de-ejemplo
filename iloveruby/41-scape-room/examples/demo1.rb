
room(:main) do
  puts "Estás en una habitación a oscuras."
  puts "Ves una puerta sucia al fondo."
  puts "A tus pies hay un objeto que parece una linterna."

  actions = {
              'p' => 'Salir por la puerta',
              'c' => 'Coger la linterna'
            }
  option = wait_for(actions)
  next_state(option)
end

room('p') do
  puts "Estás abriendo la puerta..."
  sleep 2
  puts "..."
  next_state(:exit)
end

room('c') do
  puts "Cogiste el objeto pero estaba roto"
  next_state(:main)
end
