class Checkers
  def initialize
    @board = Board.new
    @player1 = Player.new(:black)
    @player2 = Player.new(:red)
  end
  
  def play
    
    loop do
      
      if(@board.lose?(player1.color))
        puts "Player2 Wins!"
        exit
      else
        
      end
      
      if(@board.lose?(player2.color))
        puts "Player1 Wins!"
        exit
      else
        
      end
    end
  end
end