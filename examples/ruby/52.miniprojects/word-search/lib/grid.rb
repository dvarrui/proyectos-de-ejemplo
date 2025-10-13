require_relative 'cell'

class Grid
  @@directions = {
    n: {row: -1, col: 0},
    ne: {row: -1, col: 1},
    e: {row: 0, col: 1},
    se: {row: 1, col: 1},
    s: {row: 1, col: 0},
    sw: {row: 1, col: -1},
    w: {row: 0, col: -1},
    nw: {row: -1, col: -1},
  }

  def initialize(size)
    @size = size
    @matriz = []
    (0..size).each do |row|
      data = []
      (0..size).each do |col|
        data << Cell.new(row, col) 
      end
      @matriz << data
    end
  end

  def show
    puts "Show grid:"
    @matriz.each do |row|
      text = ""
      row.each { |cell| text += cell.to_s }
      puts text
    end
  end

  def add(word, row, col, move)
    row_step = @@directions[move][:row]
    col_step = @@directions[move][:col]
    letters = word.chars
    arow = row
    acol = col
    letters.each do |c|
      return false if acol >= @size || arow >= @size

      cell = @matriz[arow][acol]
      if cell.empty? || cell.letter == c
        cell.letter = c
        arow += row_step
        acol += col_step
      end
    end
    true
  end

  def find_available_locations_for(word)
    locations = []
    (0..size).each do |row|
      (0..@size).each |col|
        @@directions.each do |dir|
          if fit?(word, row, col)
            locations << { word: word, row: row, col: col }
          end
      end
    end
    locations
  end
end