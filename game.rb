require_relative './board'

class Game
  attr_accessor :board, :current_player
  attr_reader   :computer, :user

  def initialize computer, user
    @board          = Board.new().gameboard
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

  def won?
    check_horizontal? || check_vertical?
  end

  def check_horizontal?
    self.board.each do |row|
      if row.uniq.length == 1 && row.first != ' '
        return true
      end
    end
    return false
  end

  def check_vertical?
    self.board.transpose.each do |col|
      if col.uniq.length == 1 && col.first != ' '
        return true
      end
    end
    return false
  end

  def winner
    @current_player
  end
end
