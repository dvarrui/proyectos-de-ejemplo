require_relative "load"
require_relative "show"

class Graph
  attr_reader :filename, :nodes, :arcs

  def directed?
    @directed
  end
end