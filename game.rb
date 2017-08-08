require_relative './board'
require_relative './player'

class Game
  attr_accessor :board
  def initialize computer, user
    @board    = Board.new
    @computer = computer
    @user     = user
  end
end
