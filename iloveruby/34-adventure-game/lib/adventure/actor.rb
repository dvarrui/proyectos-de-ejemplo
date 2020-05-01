
class Actor
  attr_accessor :name
  attr_accessor :room

  def initialize(args = {})
    @name = args[:name] if args[:name]
    @room = args[:room] if args[:room]
  end

  def go(param, rooms)
    target = rooms[@room].doors[param]
    if target.nil?
      puts "¡No entiendo la orden!\n"
      return false
    end
    if rooms[target].nil?
      puts "[ERROR] Revisa la definición de la habitación #{@room}!"
      return false
    end
    @room = target
    true
  end
end
