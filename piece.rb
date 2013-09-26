class Piece
  attr_reader :color, :pos, :type
  
  def initialize(initial_pos, color)
    @color = color
    @pos = initial_pos
    @type = "P"
    
    color == :black ? num = 1 : num = -1
    @sliding_deltas = [[num, 1], [num, -1]]
    @jumping_deltas = [[num+1, 2], [num+1, -2]]
  end
  
  def poss_moves(board)
    #finds all possible moves the piece can make by calling sliding_moves and jumping_moves
  end
  
  def king_piece
    @type = "K"
    #changes deltas of piece so that piece can move like a king
  end
  
  def sliding_moves(board)
    #finds all possible moves the piece can make by sliding
  end
  
  def jumping_moves(board)
    #finds all possible moves the piece can make by jumping- including chains
  end
  
  private
  
  attr_reader :sliding_deltas, :jumping_deltas
end