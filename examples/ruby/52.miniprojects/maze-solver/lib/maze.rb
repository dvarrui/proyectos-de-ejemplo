class Maze

  def initialize(map)
    @map = map
    @max = { 
      rows: @map.count,
      cols: @map.map { _1.count }.max
    }
    init
  end

  def show
    puts ""
    print "Maze (#{@max[:rows]}x#{@max[:cols]})"
    print "| player(#{@player.coord.join(',')})"
    print "| target(#{@target.coord.join(',')})"
    print "| solved? #{@solved}\n"
    puts ""
    @map.each_with_index do |row, rowindex|
      line = row.map(&:to_s).join
      puts "#{rowindex} | #{line}"
    end
  end

  def solve!
    current = @player.coord
    @solved = find(current)
  end

  def solved?
    @solved = find(@player.coord)
  end

  private

  def init
    @solved = false

    @map.each_with_index do |row, rowindex|
      row.each_with_index do |c, colindex|
        c.row = rowindex
        c.col = colindex
        @player = c if c.type == :player 
        @target = c if c.type == :target
      end
    end
  end

  def cell(coord)
    @map[coord[0]][coord[1]]
  end

  def find(current)
    return true if cell(current).type == :target
    return false unless inside_map?(current)
    return false unless cell(current).available?

    cell(current).visited!

    return true if find(cell(current).north)
    return true if find(cell(current).east)
    return true if find(cell(current).south)
    return true if find(cell(current).west)

    cell(current).unvisited!
    false
  end

  def inside_map?(coord)
    row = coord[0]
    col = coord[1]
    return false if row < 0 || row > @max[:rows]
    return false if col < 0 || col > @max[:cols]
    true
  end
end
