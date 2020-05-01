
class Room
  attr_accessor :id
  attr_accessor :name
  attr_accessor :desc
  attr_accessor :links

  def initialize(args = {})
    @id = args[:id] if args[:id]
    @name = args[:name] if args[:name]
    @desc = args[:desc] if args[:desc]
    @links = []
  end
end
