
module ShowGraph
  def show(mode=:default)
    puts "Graph (filename: #{@filename})"
    puts "  > nodes (#{@nodes.size})"

    show_arcs
    show_cangotos if mode == :debug
    show_all_components
  end

  def show_arcs
    puts "  > arcs  (#{@arcs.size})"
    @arcs.each do |arc|
      puts "    | #{arc[0]} --> #{arc[1]}"
    end
  end

  def show_cangotos
    return if @cangotos.size.zero?

    puts "  > cangotos:"
    @cangotos.each_with_index do |value, index|
      puts "    | node #{index} -> #{value.join(', ')}" unless value.nil?
    end
  end

  def show_all_components
    return if (@cc.size + @cfc.size).zero?

    show_components('cc ', @cc)
    show_components('cfc', @cfc)
  end

  def show_components(title, values)
    puts "  > #{title} (#{values.size})"
    values.each_with_index do |value, index|
      puts "    | #{title} #{index + 1} ==> #{value.to_s}" unless value.nil?
    end
  end
end
