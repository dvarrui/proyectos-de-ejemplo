require_relative "cell"

class CellFactory
  CODE = {
    "0" => :empty,
    "1" => :wall,
  }

  def self.create(type)

    Cell.new()
  end
end