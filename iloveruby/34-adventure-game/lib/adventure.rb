
require 'singleton'
require 'rainbow'
require_relative 'adventure/room'
require_relative 'adventure/actor'
require_relative 'adventure/item'

class Adventure
  include Singleton
  attr_accessor :items_per_site

  def initialize
    @rooms = {}
    @actors = {}
    @items = {}
  end

  def start
    create
    @items_per_site = { 'player' => [] }
    @rooms.each_key { |key| @items_per_site[key] = [] }
    @items.each_pair { |key, value| @items_per_site[value.site] << key }
    play
  end

  def add_room(name, args)
    @rooms[name] = Room.new(args)
  end

  def add_actor(name, args)
    @actors[name] = Actor.new(args)
  end

  def add_item(name, args)
    @items[name] = Item.new(args)
  end

  def get_room(key)
    @rooms[key]
  end

  def get_actor(key)
    @actors[key]
  end

  def get_item(key)
    @items[key]
  end

private

  def play
    # show_intro
    puts intro
    print "(Pulsa enter para continuar)"
    $stdin.gets.strip
    show_game
    while(true)
      global_logic
      logic
    end
  end

  def show_game
    player = get_actor('player')
    get_room(player.room).show
    puts "\n"
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
      return
    elsif @action == 'help'
      puts "\nAcciones disponibles: "
      puts "  - quit      # Salir del programa"
      puts "  - help      # Mostrar esta ayuda"
      puts "  - go   DIR  # Avanzar por DIRECTION"
      puts "  - take ITEM # Coger objeto"
      puts "  - drop ITEM # Dejar objeto"
      puts "  - use ITEM  # Usar objeto"
      return
    elsif @action == 'quit'
      puts "\n¡Adios!"
      exit
    elsif @action == 'take'
      return
    end
    param = @action
    param = @param if @action == 'go'
    if get_actor('player').go(param, @rooms)
      show_game
    end
  end
end
