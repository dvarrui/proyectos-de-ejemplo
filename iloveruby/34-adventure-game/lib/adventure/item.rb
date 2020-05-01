
class Item
  attr_accessor :name
  attr_accessor :description
  attr_accessor :room_id
  attr_accessor :actions

  def initialize
    @actions = []
  end
end
