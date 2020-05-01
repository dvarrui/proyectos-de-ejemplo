
require 'singleton'
require 'rainbow'
require_relative 'adventure/actor'
require_relative 'adventure/room'

class Adventure
  include Singleton

  def initialize
    @rooms = {}
    @actors = {}
  end

  def add_room(name, args)
    @rooms[name] = Room.new(args)
  end

  def add_actor(name, args)
    @actors[name] = Actor.new(args)
  end

  def start
    create
    play
  end

private

  def show_intro
    puts intro
    print "(Pulsa enter para continuar)"
    $stdin.gets.strip
  end

  def show_game
    @player = @actors['player']
    puts "\nEstás en #{@player.room}\n"
    puts @rooms[@player.room].desc
  end

  def get_input
    print "=> "
    @input = $stdin.gets.strip
  end

  def global_logic
    get_input
    if @input == 'quit'
      puts "¡Adios!"
      exit
    elsif @input == 'help'
      puts "Acciones disponibles: "
      puts "  - quit      # Salir del programa"
      puts "  - help      # Mostrar esta ayuda"
      puts "  - go   DIR  # Avanzar por DIRECTION"
      puts "  - take ITEM # Coger objeto"
      puts "  - drop ITEM # Dejar objeto"
      puts "  - use ITEM  # Usar objeto"
    end
  end

  def play
    show_intro
    while(true)
      show_game
      global_logic
      logic
    end
  end
end
