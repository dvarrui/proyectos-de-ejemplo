
class Actor
  attr_accessor :name
  attr_accessor :room

  def initialize(args = {})
    @name = args[:name] if args[:name]
    @room = args[:room] if args[:room]
  end
end
