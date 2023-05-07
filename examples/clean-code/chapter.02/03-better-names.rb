# Better names (version 3)

STATUS_VALUE = 0
FLAGGED = 4

def get_flagged_cells
  flagged_cells = []
  game_board.each do |cell|
    flagged_cells << cell if cell[STATUS_VALUE] == FLAGGED
  end

  flagged_cells
end
