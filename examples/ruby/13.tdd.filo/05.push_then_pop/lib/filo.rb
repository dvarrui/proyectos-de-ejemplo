
class Filo

  def initialize
    @elements = Array.new(10,0)
    @push_index = 0
    @pop_index = 0
  end

  def size
    (@push_index - @pop_index).abs
  end

  def empty?
    size.zero?
  end

  def push(element)
    @elements[@push_index] = element
    @push_index += 1
    @push_index = 0 if @push_index > @elements.size
  end

  def pop
    return nil if size.zero?
    # require 'debug'; binding.break
    output = @elements[@pop_index]
    @pop_index += 1
    @pop_index = 0 if @pop_index > @elements.size
    output
  end
end
