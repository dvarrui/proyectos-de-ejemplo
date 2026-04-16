
class Graph
  def show
    puts "Graph (filename: #{@filename})"
    puts "  > nodes (#{@nodes.size})"
    puts "  > arcs  #{(directed?() ? '(directed)' : '')}" 
    @arcs.each do |arc|
      arrow = "--"
      arrow = "->" if directed?
      puts "    | #{arc[0]} #{arrow} #{arc[1]}"
    end
  end
end
