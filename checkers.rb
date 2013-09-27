require_relative 'board'
require_relative 'player'

class Checkers
  def initialize
    @board = Board.new
    @player1 = Player.new(:black)
    @player2 = Player.new(:red)
  end
  
  def play
    
    loop do
      
      if(@board.lose?(@player1.color))
        puts "Player2 Wins!"
        exit
      else
        puts "Player 1:"
        @board.display_board
        begin
          move_sequence = @player1.prompt_user
          @board.perform_moves(move_sequence)
        rescue IllegalMoveError => e
          puts e.message
          retry
        end
      end
      
      if(@board.lose?(@player2.color))
        puts "Player1 Wins!"
        exit
      else
        puts "Player 2:"
        @board.display_board
        begin
          move_sequence = @player2.prompt_user
          @board.perform_moves(move_sequence)
        rescue IllegalMoveError => e
          puts e.message
          retry
        end
      end
    end
  end
end