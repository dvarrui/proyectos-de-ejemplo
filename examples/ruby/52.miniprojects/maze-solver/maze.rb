class Maze
  attr_accessor :map

  def to_s
    output = ""
    @map.each do |row|
      output += row.map(&:to_s).join
      output += "\n"
    end
    output
  end
end