require_relative './board'

class Game
  attr_accessor :board, :current_player
  attr_reader   :computer, :user

  def initialize computer, user
    @board          = Board.new
    @computer       = computer
    @user           = user
    @current_player = @user.letter == 'X' ? @user : @computer
  end

  def switch_current_player
    case @current_player
    when @user
      @current_player = @computer
    when @computer
      @current_player = @user
    end
  end
end
