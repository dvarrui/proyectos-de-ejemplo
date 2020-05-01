
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

  def start(args)
    puts "[INFO] Starting adventure #{args[0]}"
    create
    play
  end

  def display
    @player = @actors['player']
    puts "Está usted en #{@player.room}"
    puts @rooms[@player.room].desc
  end

  def play
    while(true)
      display
      print "=> "
  	  input = $stdin.gets.strip
      puts "[DEBUG] " + input
      exit if input == 'quit'
      logic
    end
  end
end
