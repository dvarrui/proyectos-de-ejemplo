# Better names (version 5)

def get_flagged_cells
  game_board.select { |cell| cell.is_flagged? }
end
