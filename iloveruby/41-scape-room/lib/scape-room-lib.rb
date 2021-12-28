#!/usr/bin/env ruby
require 'pry-byebug'

class Game
  attr_accessor :rooms

  def initialize
    @rooms = {}
    @next = :main
    @current = :main
  end

  def start
    puts "Iniciando el juego (exit = salir)"
    unless @next == 'exit'
      current = @next
      if @rooms[current].nil?
        puts "Estado #{current} no definido"
        exit 1
      end
      block = @rooms[current]
      block.call
    end
    puts "Fin del juego"
  end

  def next_state=(state)
    @next = state
  end
end

@game = Game.new

def room(name, &block)
  @game.rooms[name] = block
end

def next_state(state)
  @game.next_state(state)
end
