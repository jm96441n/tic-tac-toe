require_relative './board'

class Game
  attr_accessor :board
  attr_reader   :computer, :user

  def initialize computer, user
    @board    = Board.new
    @computer = computer
    @user     = user
  end
end
