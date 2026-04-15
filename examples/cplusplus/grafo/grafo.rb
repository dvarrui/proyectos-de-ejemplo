#!/usr/bin/env ruby
require "yaml"

class Grafo
  def load(filename)
    @filename = filename
    lines = File.read(filename).split("\n")
    fill_header(lines.shift)
    fill_arcos(lines)
  end

  def info
    puts "Grafo:"
    puts "* filename : #{@filename}"
    puts "* dirigido : #{@dirigido}"
    puts "* num_nodos: #{@num_nodos}"
    puts "* arcos:"
    @arcos.each do |arco|
      puts "  #{arco[:from]} - #{arco[:to]} (#{arco[:weight]})"
    end
  end

  private

  def fill_header(line)
    values = line.split(" ")
    @num_nodos = values[0].to_i
    @dirigido = (values[1].to_i == 1)
  end

  def fill_arcos(lines)
    @arcos = []
    lines.each do |line|
      values = line.split(" ")
      arco = {
        from: values[0].to_i,
        to: values[1].to_i,
        weight: values[2].to_i
      }
      @arcos << arco
    end
  end
end
