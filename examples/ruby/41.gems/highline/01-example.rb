#!/usr/bin/env ruby
# https://github.com/JEG2/highline

require 'highline'

# Basic usage

cli = HighLine.new
answer = cli.ask "What do you think?"
puts "You have answered: #{answer}"

# Default answer
cli.ask("Company?  ") { |q| q.default = "none" }


# Validation

cli.ask("Age?  ", Integer) { |q| q.in = 0..105 }
cli.ask("Name?  (last, first)  ") { |q| q.validate = /\A\w+, ?\w+\Z/ }


# Type conversion for answers:

cli.ask("Birthday?  ", Date)
cli.ask("Interests?  (comma sep list)  ", lambda { |str| str.split(/,\s*/) })


# Reading passwords:

cli.ask("Enter your password:  ") { |q| q.echo = false }
cli.ask("Enter your password:  ") { |q| q.echo = "x" }


# ERb based output (with HighLine's ANSI color tools):

cli.say("This should be <%= color('bold', BOLD) %>!")


# Menus:

cli.choose do |menu|
  menu.prompt = "Please choose your favorite programming language?  "
  menu.choice(:ruby) { cli.say("Good choice!") }
  menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
  menu.default = :ruby
end

## Using colored indices on Menus

HighLine::Menu.index_color   = :rgb_77bbff # set default index color

cli.choose do |menu|
  menu.index_color  = :rgb_999999      # override default color of index
                                       # you can also use constants like :blue
  menu.prompt = "Please choose your favorite programming language?  "
  menu.choice(:ruby) { cli.say("Good choice!") }
  menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
end
