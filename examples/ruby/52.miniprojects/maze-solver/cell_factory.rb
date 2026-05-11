require_relative "cell"

class CellFactory
  TYPES = {
    "0" => :empty,
    "1" => :wall,
    "8" => :player,
    "9" => :end
  }

  def self.create(code)
    Cell.new(TYPES[code])
  end
end