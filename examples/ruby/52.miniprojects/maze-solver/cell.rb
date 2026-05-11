class Cell
  CHARS = {
     empty: " ",
     wall: "#",
     player: "*",
     target: "X",
     visited: "."
  }
  attr_reader :type
  attr_accessor :row, :col

  def initialize(type)
    @type = type
  end

  def coord
    [row, col]
  end

  def to_s
    CHARS[@type]
  end

  def available?
    return true if %i[empty target player].include? @type
    return false
  end

  def visited!
    @type = :visited
  end

  def unvisited!
    @type = :empty
  end

  def north
    [@row - 1, @col]
  end

  def south
    [@row + 1, @col]
  end

  def east
    [@row, @col +1]
  end

  def west
    [@row, @col - 1]
  end
end