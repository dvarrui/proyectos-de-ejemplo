class Grid
  def initialize(size)
    @size = size
    @matriz = Array.new(size) { Array.new(size, '.') }
  end

  def show
    puts "Show grid:"
    @matriz.each do |line|
      puts line.join.to_s
    end
  end

  def add(word, row, col, move)
    directions = {
      e: {row: 0, col: 1},
      w: {row: 0, col: -1},
      n: {row: -1, col: 0},
      s: {row: 1, col: 0}
    }
    row_step = directions[move][:row]
    col_step = directions[move][:col]
    letters = word.chars
    arow = row
    acol = col
    letters.each do |c|
      if acol >= @size || arow >= @size
        return false
      elsif @matriz[arow][acol] == '.' || @matriz[arow][acol] == c
        @matriz[arow][acol] = c
        arow += row_step
        acol += col_step
      end
    end
    true
  end
end