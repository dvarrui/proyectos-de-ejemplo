
module CalculateGraph
  def calculate
    calculate_reaches
    calculate_components
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

  def calculate_components
    @components = []
    if directed?
      calculate_cfc
    else
      calculate_cc
    end
  end

  def calculate_cc
    frees = @nodes.dup
    @nodes.each do |node|
      next unless frees.include? node
      component = [node] + @reaches[node]
      frees -= component
      @components << component
    end
  end

  def skip_calculate_cc_node(node, acc, visited)
    @arcs.each do |arc|
      if arc[0] == node && !visited.include?(arc[1])
        visited << arc[1]
        acc << arc[1]
        acc = calculate_cc_node(arc[1], acc, visited)
      end
    end
    acc
  end

  def calculate_cfc
    frees = @nodes.dup
    @nodes.each do |node1|
      next unless frees.include? node1

      component = [node1]
      @reaches[node1].each do |node2|
        if @reaches[node2].include?(node1)
          component << node2
          frees -= component
        end
      end
      @components << component
    end
  end
end