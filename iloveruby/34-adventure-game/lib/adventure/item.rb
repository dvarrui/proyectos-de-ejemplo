
require_relative '../adventure'

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
    @taken = false
  end

  def show
    puts @states[@current_state]
  end

  def taken_by(player)
    if player.room.id == @room
      @room = ''
      @taken = true
      return
    else
      puts "No puedes coger ese objeto!"
    end
  end

  def drop(room_id)
    @room = room_id
    @taken = false
  end

  def taken?
    @taken
  end
end
