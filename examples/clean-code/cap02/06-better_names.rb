# Better names (version 6)

def get_flagged_cells
  game_board.select { _1.is_flagged? }
end
