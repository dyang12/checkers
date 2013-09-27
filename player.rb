
class Player
  attr_accessor :color
  def initialize(color)
    @color = color
  end
  
  def prompt_user
    move_sequence = []
    
    puts "Please put all the moves you would like to make.\n" +
          "Input q to end your sequence of moves.\n" +
          "What is the position of the piece you would like to move?"
    start_input = gets.chomp
    
    until start_input == "q"
      puts "Where would you like to move that piece?"
      end_input = gets.chomp
      
      start_pos = convert_to_position(start_input)
      end_pos = convert_to_position(end_input)
      
      move_sequence << [start_pos, end_pos]
      
      puts "What is the position of the piece you would like to move?"
      start_input = gets.chomp
    end
    
    move_sequence
  end
  
  def convert_to_position(str)
    pos = str.scan(/\w/)
    if pos.length > 2
      raise ArgumentError.new "That is not a position on the board"
    else
      pos.map! { |i| i.to_i }
    end
  end
end