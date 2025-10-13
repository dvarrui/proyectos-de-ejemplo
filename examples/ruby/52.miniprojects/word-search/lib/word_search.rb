require_relative 'grid'

class WordSearch
  attr_reader :grid

  def initialize(words: words, grid_size: size)
    @words = words.sort_by { _1.length}.reverse
    @size = grid_size
    @solution = :not_solution
  end

  def process    
    grid = Grid.new(@size)
    @solution = find_solution(@words.dup, grid)
  end

  def find_solution(words, grid)
    return grid if words.size.zero?

    word = words.delete_at(0)
    words.delete_at(0)
    locations = grid.find_available_locations_for(word)

    return :no_solution if locations.empty?
    find_solution(words, grid)
  end

  def has_a_solution?
    @solution != :no_solution
  end
end