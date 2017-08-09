require_relative './player'
class Computer < Player
  def make_move board
    i = 0
    j = 0
    until !board.space_taken?("#{i}, #{j}")
      i = rand(0..2)
      j = rand(0..2)
    end
    board.take_position self.letter, "#{i}, #{j}"
  end
end
