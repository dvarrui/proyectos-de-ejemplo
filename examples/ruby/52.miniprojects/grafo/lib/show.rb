
module ShowGraph
  def show
    puts "Graph (filename: #{@filename})"
    puts "  > nodes (#{@nodes.size})"

    show_arcs
    show_reaches
    show_components
  end

  def show_arcs
    puts "  > arcs  (#{@arcs.size}) #{(directed?() ? '(directed)' : '')}"
    @arcs.each do |arc|
      arrow = "--"
      arrow = "->" if directed?
      puts "    | #{arc[0]} #{arrow} #{arc[1]}"
    end
  end

  def show_reaches
    return if @reaches.size.zero?

    puts "  > reaches:"
    @reaches.each_with_index do |value, index|
      puts "    | node #{index} ==> #{value.join(',')}" unless value.nil?
    end
  end

  def show_components
    return if @components.size.zero?

    puts "  > components:"
    @components.each_with_index do |value, index|
      puts "    | component #{index} ==> #{value.join(',')}" unless value.nil?
    end
  end
end
