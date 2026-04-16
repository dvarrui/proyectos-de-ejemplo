
class Graph
  def load(filename)
    if filename.nil?
      puts "Usage: ruby main.rb PATH/TO/FILE"
      exit 1
    end
    unless File.exist?(filename)
      puts "ERROR: File not found! #{filename}"
      exit 1
    end
    @filename = filename
    lines = File.read(filename).split("\n")

    fill_header(lines)
    fill_arcs(lines)
  end

  private

  def fill_header(lines)
    max_nodes = lines.shift.to_i
    @nodes = (1..max_nodes).to_a
    @directed = (lines.shift.start_with? "d")
  end

  def fill_arcs(lines)
    @arcs = []
    lines.each do |line|
      values = line.split(" ")
      arc = [
        values[0].to_i,
        values[1].to_i
    ]
      @arcs << arc
    end
  end
end
