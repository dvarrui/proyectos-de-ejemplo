
module LoadGraph
  def load(filename)
    exit(1) unless file_ok?(filename)

    @filename = filename
    lines = File.read(filename).split("\n")

    fill_header(lines)
    fill_arcs(lines)
  end

  def file_ok?(filename)
    if filename.nil?
      puts "Usage: ruby main.rb PATH/TO/FILE"
      return false
    end
    unless File.exist?(filename)
      puts "ERROR: File not found! #{filename}"
      return false
    end
    true
  end

  def fill_header(lines)
    max_nodes = lines.shift.to_i
    @nodes = (1..max_nodes).to_a
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
