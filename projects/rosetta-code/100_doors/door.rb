class Door
  def initialize(id)
    @id = id
    @open = false
  end

  def toggle!
    @open = not @open
  end

  def to_s
    state = if @open
      'open'
    else
      'closed'
    end
    "Door[#{@id}]=#{state}"
  end
end

