# Better names (version 4)

def get_flagged_cells
  flagged_cells = []
  game_board.each do |cell|
    flagged_cells << cell if cell.is_flagged?
  end

  flagged_cells
end
