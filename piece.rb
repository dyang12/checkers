module IncrementPosition
  def increment_position(pos, delta)
    dx, dy = delta
    [pos[0]+dx, pos[1]+dy]
  end
end

class Piece
  include IncrementPosition
  attr_accessor :curr_pos
  attr_reader :color, :type
  
  def initialize(initial_pos, color)
    @color = color
    @curr_pos = initial_pos
    @type = "P"
    
    color == :black ? num = -1 : num = 1
    @deltas = [[num, 1], [num, -1]]
  end
  
  def promote?
    (color == :black && curr_pos[0] = 0) || (color == :red && curr_pos[0] == 7)
  end
  
  def king_me
    @type = "K"
    
    color == :black ? num = 1 : num = -1
    @deltas.concat([[num, 1], [num, -1]])
  end
  
  def poss_moves(board)
    poss_moves = Hash.new { |hash, key| hash[key] = [] }
    deltas.each do |delta|
      pos = increment_position(curr_pos, delta)
      if valid_slide?(board, pos)
        poss_moves[:slide] << pos
      else
        if board.is_enemy?(pos, color)
          pos = increment_position(pos, delta)
          poss_moves[:jump] << pos if board.empty?(pos)
        end
      end
    end
    
    poss_moves
  end
  
private
def valid_slide?(board, pos)
  board.empty?(pos) && board.in_bounds?(pos)
end
  
attr_reader :deltas

end