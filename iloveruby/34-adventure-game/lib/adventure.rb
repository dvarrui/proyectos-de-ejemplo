
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
    @rooms[@player.room].show
  end

  def get_input
    print "=> "
    @input = $stdin.gets.strip
    @inputs = @input.split(' ')
    @action = @inputs[0]
    @param = @inputs[1]
  end

  def global_logic
    get_input
    if @action.nil?
      show_game
    elsif @action == 'go'
      @player.go(@param, @rooms)
      show_game
      puts "\n"    
    elsif @action == 'help'
      puts "\nAcciones disponibles: "
      puts "  - quit      # Salir del programa"
      puts "  - help      # Mostrar esta ayuda"
      puts "  - go   DIR  # Avanzar por DIRECTION"
      puts "  - take ITEM # Coger objeto"
      puts "  - drop ITEM # Dejar objeto"
      puts "  - use ITEM  # Usar objeto"
    elsif @action == 'quit'
      puts "\n¡Adios!"
      exit
    else
      puts "¡No entiendo!\n\n"
    end
  end

  def play
    show_intro
    show_game
    while(true)
      global_logic
      logic
    end
  end
end
