require_relative 'piece'

class Board
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
    populate_board(:red)
    populate_board(:black)
  end
  
  def populate_board(color)
    color == :red ? rows = (0..2).to_a : rows = (5..7).to_a
    rows.each do |row|
      if row.even?
        (0..7).select { |col| col.even? }.each do |even_col|
          piece = Piece.new([row, even_col], color)
          self[[row, even_col]] = piece
        end
      else
        (0..7).select { |col| col.odd? }.each do |odd_col|
          piece = Piece.new([row, odd_col], color)
          self[[row, odd_col]] = piece
        end
      end
    end
  end
  
  
  def display_board
    puts "  0 1 2 3 4 5 6 7"
    (0..7).each do |i|
      row = "#{i}|"
      
      (0..7).each do |j|
        if empty?([i, j])
          row += "_|" 
        else
          row += "#{self[[i, j]].type}|"
        end
      end
      
      puts row
    end
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
    @board[dx][dy]
  end
  
  def empty?(pos)
    return self[pos].nil?
    true
  end
  
  def in_bounds?(pos)
    return true if pos.all? { |i| i.between?(0, 7) }
    false
  end
  
  def lose?(color)
    #checks if color has anymore pieces
    #returns true if no pieces left, false otherwise
  end
end