
module CalculateGraph
  def calculate
    calculate_reaches
  end

  def calculate_reaches
    @reaches = []
    @nodes.each do |node|
      @reaches[node] = calculate_reaches_node(node, [], [node])
    end
  end

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