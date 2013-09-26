class Piece
  attr_reader :color, :pos
  
  def initialize(initial_pos, option = {})
    option.has_key?(:black) ?  @color = :black : @color = :red
    @pos = initial_pos
    
    color == black ? num = 1 : num = -1
    @sliding_deltas = [[num, 1], [num, -1]]
    @jumping_deltas = [[num+1, 2], [num+1, -2]]
  end
  
  def poss_moves(board)
    #finds all possible moves the piece can make by calling sliding_moves and jumping_moves
  end
  
  def king_piece
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