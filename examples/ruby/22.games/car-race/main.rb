#!/usr/bin/env ruby

require_relative "screen"
require_relative "level"

trap('SIGINT') { puts "Bye!"; exit! }

screen = Screen.new
level = Level.new(screen)

screen.clear
timestamp = Time.now

loop do
  delta = Time.new - timestamp
  timestamp = Time.new

  level.update(delta)
  level.render

  screen.move_top_left
  wait = 0.2
  sleep(wait - delta) if delta < wait
end
