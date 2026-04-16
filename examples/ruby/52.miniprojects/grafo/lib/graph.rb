require_relative "load"
require_relative "show"

class Graph
  include LoadGraph
  include ShowGraph

  attr_reader :filename, :nodes, :arcs
  attr_reader :reaches

  def initialize
    @reaches = []
  end

  def directed?
    @directed
  end

  def calculate_reaches
    @reaches = []
    @nodes.each do |node|
      @reaches[node] = calculate_reaches_node(node, [], [node])
    end
  end

  private

  def calculate_reaches_node(node, acc, visited)
    @arcs.each do |arc|
      if arc[0] == node && !visited.include?(arc[1])
        acc << arc[1]
        visited << arc[1]
        acc = calculate_reaches_node(arc[1], acc, visited)
      end
    end
    acc
  end

end