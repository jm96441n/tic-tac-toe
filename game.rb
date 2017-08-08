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
    until won?
      switch_current_player
      make_move
      @board.display_current_board
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
    puts "Select a space by putting in the coordinates of the space you would like, starting from the top left (For example, the top left space would be '1,1', the top right space would be '1,3')"
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
    check_horizontal? || check_vertical? || check_diagonal?
  end

  def check_horizontal?
    self.board.gameboard.each do |row|
      if row.uniq.length == 1 && row.first != ' '
        return true
      end
    end
    return false
  end

  def check_vertical?
    self.board.gameboard.transpose.each do |col|
      if col.uniq.length == 1 && col.first != ' '
        return true
      end
    end
    return false
  end

  def check_diagonal?
    check_left_diagonal? || check_right_diagonal?
  end

  def check_left_diagonal?
    check_arr = []
    i = 0
    until i > 2
      check_arr << self.board.gameboard[i][i]
      i += 1
    end
    if check_arr.uniq.length == 1 && check_arr.first != ' '
      return true
    end
    return false
  end

  def check_right_diagonal?
    check_arr = []
    i = 0
    j = 2
    until i > 2
      check_arr << self.board.gameboard[i][j]
      i += 1
      j -= 1
    end
    if check_arr.uniq.length == 1 && check_arr.first != ' '
      return true
    end
    return false
  end

  def winner
    case @current_player
    when @user
      puts "You won!"
    when @computer
      puts "Good game, but the computer got the best of you, try again!"
    end
  end
end
