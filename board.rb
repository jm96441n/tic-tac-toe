class Board
  attr_accessor :gameboard
  def initialize
    @gameboard = [[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']]
  end

  def take_position letter, position
    position_arr = position.split('')
    if @gameboard[position_arr.first.to_i][position_arr.last.to_i] == ' '
      @gameboard[position_arr.first.to_i][position_arr.last.to_i] = letter
    end
  end
end
