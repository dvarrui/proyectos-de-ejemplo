class Cell
  EMPTY = '_'

  attr_reader :row, :col, :data

  def initialize(row, col)
    @row = row
    @col = col
    reset
  end

  def empty?
    @data == EMPTY
  end

  def reset
    @amount = 0
    @data = EMPTY
  end

  def add(data)
    if empty? || @data == data
      @data = data
      @amount += 1
    else
      raise "Cell.add(#{data}): current data (#{@data}) different from new one!"
    end
  end

  def remove
    raise "Cell.remove: No data!" if @amount.zero?
    @amount -= 1
    @data = EMPTY if @amount.zero?
  end

  def to_s
    @data.to_s
  end
end