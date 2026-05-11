class Cell
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    @type
  end
end