class Board
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) {Array.new(8)}
    # populate_board
  end
  
  def populate_board
    #addes pieces to board
  end
  
  def display_board
    #displays the play board
  end
  
  def move(start_pos, end_pos)
    #checks if start_pos is valid(proper color, not empty, not out of bounds)
    #returns exception if invalid
    #else checks if end_pos is valid(end_pos is within poss_moves)
    #returns exception if invalid
    #else makes move & update board
  end
  
  def []=(pos, piece)
    raise "Out of Bounds" unless in_bounds?(pos)
    dx, dy = pos
    @board[dx][dy] = piece
  end
  
  def [](pos)
    raise "Out of Bounds" unless in_bounds?(pos)
    dx, dy = pos
    board[dx][dy]
  end
  
  def empty?(pos)
    return false if board[dx][dy].nil?
    true
  end
  
  def in_bounds?(pos)
    return true if pos.each { |i| i.between?(1, 7) }
    false
  end
  
  def lose?(color)
    #checks if color has anymore pieces
    #returns true if no pieces left, false otherwise
  end
end