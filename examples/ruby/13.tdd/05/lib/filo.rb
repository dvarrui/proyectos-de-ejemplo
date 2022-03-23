
class Filo

  def initialize
    @elements = []
  end

  def size
    @elements.size
  end

  def empty?
    @elements.size.zero?
  end

  def push(element)
    @elements << element
  end

  def pop
    @elements.pop
  end
end
