class Player
  attr_reader :letter

  def initialize letter
    @letter = letter.upcase
  end

  def user_move board
    puts "Select a space by putting in the coordinates of the space you would like, starting from the top left (For example, the top left space would be '1,1', the top right space would be '1,3') in the format of: Row, Column"
    position = gets.chomp
    until !board.space_taken? position
      puts "Please select another space, this space is taken"
      position = gets.chomp
    end

    board.take_position self.letter, position
  end

  def computer_move board
    i = 0
    j = 0
    until !board.space_taken? "#{i}, #{j}"
      i = rand(0..2)
      j = rand(0..2)
    end
    board.take_position self.letter, "#{i}, #{j}"
  end
end
