class Piece
  attr_reader :color, :pos
  
  def initialize(initial_pos, option = {})
    if option.has_key?(:black)
      @color = :black
    else
      @color = :red
    end
    
    @pos = initial_pos
    @sliding_deltas = []
    @jumping_deltas = []
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
end