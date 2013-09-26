require_relative 'piece'
require 'colorize'

class IllegalMoveError < StandardError
end

class Board
  include IncrementPosition
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
    populate_board(:red)
    populate_board(:black)
  end
  
  def display_board
    puts "  0 1 2 3 4 5 6 7"
    (0..7).each do |i|
      row = "#{i}|"
      
      (0..7).each do |j|
        if empty?([i, j])
          row += "_|" 
        else
          row += "#{render_piece(self[[i, j]])}|"
        end
      end
      
      puts row
    end
  end
  
  def move(start_pos, end_pos)
    poss_moves_hash = self[start_pos].poss_moves(self)
    poss_moves = poss_moves_hash.values.flatten(1)
    
    if poss_moves.one? {|pos| pos == end_pos }
      if poss_moves_hash[:jump].include?(end_pos)
        delta = [(end_pos[0]-start_pos[0])/2, (end_pos[1]-start_pos[1])/2]
        jumped_pos = increment_position(start_pos, delta)
        self[jumped_pos] = nil
      end
      
      piece = self[start_pos]
      piece.curr_pos = end_pos
      piece.king_me if piece.promote?
      self[end_pos] = piece
      self[start_pos] = nil
    else
      raise IllegalMoveError.new "You cannot move there!"
    end
  end
  
  def perform_moves(move_sequence)
    
  end
  
  def dup
    temp_board = Board.new
    temp_board.board = dup_board
    temp_board
  end
  
  def []=(pos, piece)
    dx, dy = pos
    @board[dx][dy] = piece
  end
  
  def [](pos)
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
  
  def is_enemy?(pos, color)
    if in_bounds?(pos)
      return true unless self[pos].color == color
    end
    false
  end
  
  def lose?(color)
    #checks if color has anymore pieces
    #returns true if no pieces left, false otherwise
  end
  
  private
  
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
  
  def render_piece(piece)
    return piece.type.light_white.underline if piece.color == :black
    return piece.type.red.underline
  end
  
  def valid_move_seq?(move_sequence)
    temp_board = dup
  end
  
  def perform_moves!(move_sequence)
    move_sequence.each do |(start_pos, end_pos)|
      move(start_pos, end_pos)
    end
  end
  
  def dup_board
    dup_board = Array.new(8) { Array.new(8) }
    
    board.each_with_index do |row, i|
      row.each_with_index do |element, j|
        dup_board[i][j] = element
      end
    end
    
    dup_board
  end
end