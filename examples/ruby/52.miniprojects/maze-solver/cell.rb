class Cell
  CHARS = {
     empty: " ",
     wall: "#",
     player: "*",
     end: "X"
  }
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    CHARS[@type]
  end
end