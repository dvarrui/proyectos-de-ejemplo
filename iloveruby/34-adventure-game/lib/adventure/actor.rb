
require_relative '../adventure'

class Actor
  attr_accessor :name

  def initialize(id, args = {})
    @name = id
    @current_room_id = args[:room] if args[:room]
  end

  def room
    Adventure.instance.rooms[@current_room_id]
  end

  def go(param)
    target_room_id = room.doors[param]
    if target_room_id.nil?
      puts "¡No entiendo la orden!\n"
      return false
    end
    if Adventure.instance.rooms[target_room_id].nil?
      puts "[ERROR] Revisa la definición de la habitación #{@current_room_id}!"
      return false
    end
    @current_room_id = target_room_id
    true
  end

  def drop(id)
    item = Adventure.instance.items[id]
    if item.nil?
      puts "El objeto #{id} no existe!"
      return
    elsif not item.taken?
      puts "No puedes hacer eso!"
      return
    end
    item.taken = false
    item.room = @current_room_id
  end
end
