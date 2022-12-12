#!/usr/bin/env ruby

require "tty-config"

config = TTY::Config.new
config.filename = "config"

puts config.read("config.yaml")
