require_relative './board'
require_relative './player'

class Game
  def initialize computer, user
    @board    = Board.new
    @computer = computer
    @user     = user
  end
end
