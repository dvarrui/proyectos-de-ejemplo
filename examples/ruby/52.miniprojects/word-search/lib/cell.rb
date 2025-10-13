class Cell
  EMPTY = '_'

  attr_reader :row, :col
  attr_accessor :letter

  def initialize(row, col)
    @row = row
    @col = col
    @amount = 0
    @letter = EMPTY
  end

  def empty?
    @letter == EMPTY
  end

  def inc
    @amount += 1
  end

  def dec
    @amount -= 1
  end

  def to_s
    @letter
  end
end