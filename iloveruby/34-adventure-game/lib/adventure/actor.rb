
class Actor
  attr_accessor :name

  def initialize(id, args = {}, rooms)
    @name = id
    @current_room_id = args[:room] if args[:room]
    @rooms = rooms
  end

  def room
    @rooms[@current_room_id]
  end
  
  def go(param)
    target_room_id = @rooms[@current_room_id].doors[param]
    if target_room_id.nil?
      puts "¡No entiendo la orden!\n"
      return false
    end
    if @rooms[target_room_id].nil?
      puts "[ERROR] Revisa la definición de la habitación #{@current_room_id}!"
      return false
    end
    @current_room_id = target_room_id
    true
  end
end
