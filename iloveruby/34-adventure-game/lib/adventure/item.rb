
class Item
  attr_accessor :name
  attr_accessor :states
  attr_accessor :site
  attr_accessor :actions

  def initialize(args = {})
    @name = args[:name] if args[:name]
    @states = args[:states] if args[:states]
    @current_state = 0
    @site = args[:site] if args[:site]
    @actions = []
  end

  def show
    puts @states[@current_state]
  end
end
