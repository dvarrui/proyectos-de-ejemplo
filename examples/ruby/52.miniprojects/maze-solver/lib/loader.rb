require_relative "cell_factory"

class Loader
  def self.call(filepath)
    lines = File.readlines(filepath)
    maze = []
    lines.each do |line|
      row = []
      line.strip.chars.each { row << CellFactory.create(_1) }
      maze << row
    end
    maze
  end
end