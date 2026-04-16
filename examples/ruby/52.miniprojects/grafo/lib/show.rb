
class Graph
  def show
    puts "Graph:"
    puts "* filename: #{@filename} | nodes: #{@nodes.size} | directed? #{directed?}"
    puts "* arcs:"
    @arcs.each do |arc|
      arrow = "--"
      arrow = "->" if directed?
      puts "  #{arc[0]} #{arrow} #{arc[1]}"
    end
  end
end
