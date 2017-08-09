require_relative './player'
class User < Player

  def make_move board
    puts "Select a space by putting in the coordinates of the space you would like, starting from the top left (For example, the top left space would be '1,1', the top right space would be '1,3') in the format of: Row, Column"

    position   = gets.chomp
    valid_move = board.valid_move?(position)
    free_space = !board.space_taken?(position)
    until valid_move && free_space
      if !valid_move
        puts "Please select a space that is on the board."
      elsif !free_space
        puts "Looks like this space is already taken, please try again."
      end

      position = gets.chomp
      valid_move = board.valid_move?(position)
      free_space = !board.space_taken?(position)
    end

    board.take_position self.letter, position
  end
end
