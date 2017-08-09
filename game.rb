require_relative './board'

class Game
  attr_accessor :board, :current_player
  attr_reader   :computer, :user

  def initialize computer, user
    @board          = Board.new()
    @computer       = computer
    @user           = user
    @current_player = choose_first_player
  end


  def play
    @board.display_current_board if @current_player == @user

    until won?
      if @board.full_board?
        puts "Board is full, nobody won!"
        return
      end
      @current_player.make_move @board
      switch_current_player
      @board.display_current_board
    end
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
    @board.check_straight_line? || @board.check_diagonal?
  end

  def winner
    case @current_player
    when @user
      puts "Good game, but the computer got the best of you, try again!"
      return @computer
    when @computer
      puts "You won!"
      return @user
    end
  end

  def choose_first_player
    num = rand(1..10)
    num.even? ? @user : @computer
  end
end
