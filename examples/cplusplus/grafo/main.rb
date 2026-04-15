#!/usr/bin/env ruby
require_relative "grafo"

grafo = Grafo.new
grafo.load("data.txt")

grafo.info