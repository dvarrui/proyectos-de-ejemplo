
class Adventure
  def create
    puts "[INFO] Creating #{__FILE__}..."

    add_room 'Dormitorio', { id: '0',
               desc: 'Estás es una pequeña habitación pintada de blanco.
Junto a tí puedes ver una cama y una mesita de noche.' }

    add_actor 'player', { room: 'Dormitorio' }
  end

  def logic
    puts "[INFO] Apply logic..."
  end
end
