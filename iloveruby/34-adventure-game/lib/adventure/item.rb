
class Item
  attr_accessor :name
  attr_accessor :states
  attr_accessor :room
  attr_accessor :actions

  def initialize(id, args = {})
    @name = id
    @states = args[:states] if args[:states]
    @current_state = 0
    @room = args[:room] if args[:room]
    @actions = []
  end

  def show
    puts @states[@current_state]
  end
end
