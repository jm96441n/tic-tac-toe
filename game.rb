require_relative './board'

class Game
  attr_accessor :board, :current_player
  attr_reader   :computer, :user

  def initialize computer, user
    @board          = Board.new()
    @computer       = computer
    @user           = user
    @current_player = @user.letter == 'X' ? @user : @computer
  end


  def play
    @board.display_current_board if @current_player == @user
    until won?
      make_move
      switch_current_player
      @board.display_current_board

      if @board.full_board?
        puts "Board is full, nobody won!"
        return
      end

    end
    puts winner
  end

  def make_move
    case @current_player
    when @user
      user_move
    when @computer
      computer_move
    end
  end

  def user_move
    puts "Select a space by putting in the coordinates of the space you would like, starting from the top left (For example, the top left space would be '1,1', the top right space would be '1,3') in the format of: Row, Column"
    position = gets.chomp
    if @board.space_taken? position
      puts "Please select another space, this space is taken"
    else
      @board.take_position @current_player.letter, position
    end
  end

  def computer_move
    i = 0
    j = 0
    until !@board.space_taken? "#{i}, #{j}"
      i = rand(0..2)
      j = rand(0..2)
    end
    @board.take_position @current_player.letter, "#{i}, #{j}"
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
    @board.check_horizontal? || @board.check_vertical? || @board.check_diagonal?
  end

  def winner
    case @current_player
    when @user
      puts "Good game, but the computer got the best of you, try again!"
    when @computer
      puts "You won!"
    end
  end
end
