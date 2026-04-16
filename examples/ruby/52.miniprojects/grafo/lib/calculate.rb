
module CalculateGraph
  def calculate
    calculate_reaches
    calculate_cc
    calculate_cfc
  end

  def calculate_reaches
    @cangotos = []
    @nodes.each do |node|
      @cangotos[node] = calculate_cangotos_node(node, [], [node])
    end
  end

  def calculate_cangotos_node(node, acc, visited)
    @arcs.each do |arc|
      if arc[0] == node && !visited.include?(arc[1])
        acc << arc[1]
        visited << arc[1]
        acc = calculate_cangotos_node(arc[1], acc, visited)
      end
    end
    acc
  end

  def calculate_cc
    @cc = []
    frees = @nodes.dup
    @nodes.each do |node|
      next unless frees.include? node
      component = [node] + @cangotos[node]
      frees -= component
      @cc << component
    end
  end

  def calculate_cfc
    @cfc = []
    frees = @nodes.dup
    @nodes.each do |node1|
      next unless frees.include? node1

      component = [node1]
      @cangotos[node1].each do |node2|
        if @cangotos[node2].include?(node1)
          component << node2
          frees -= component
        end
      end
      @cfc << component
    end
  end
end