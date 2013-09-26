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
    #sets board at pos to piece
  end
  
  def [](pos)
    #check if in bounds
    #else returns element at pos on board
  end
  
  def empty?(pos)
    #checks if board @ pos is empty or filled
    #returns true if no piece, false otherwise
  end
  
  def in_bounds?(pos)
    #checks if pos is in bounds in the board
    #returns true if in bounds, false otherwise
  end
  
  def lose?(color)
    #checks if color has anymore pieces
    #returns true if no pieces left, false otherwise
  end
end