require_relative "calculate"
require_relative "load"
require_relative "show"

class Graph
  include CalculateGraph
  include LoadGraph
  include ShowGraph

  attr_reader :filename, :nodes, :arcs
  attr_reader :reaches

  def initialize
    @reaches = []
    @components = []
  end

  def directed?
    @directed
  end
end