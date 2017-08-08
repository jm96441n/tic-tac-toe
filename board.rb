class Board
  attr_accessor :board
  def initialize
    @board = [[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']]
  end

  def take_position letter, position
    position_arr = position.split('')
    if @board[position_arr.first.to_i][position_arr.last.to_i] == ' '
      @board[position_arr.first.to_i][position_arr.last.to_i] = letter
    end
  end
end
