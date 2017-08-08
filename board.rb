class Board
  attr_accessor :gameboard
  def initialize
    @gameboard = [[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']]
  end

  def take_position letter, position
    position_arr = split_and_format_position position

    @gameboard[position_arr.first][position_arr.last] = letter
  end

  def space_taken? position
    position_arr = split_and_format_position position

    @gameboard[position_arr.first][position_arr.last] != ' '
  end

  def split_and_format_position position
    position_arr = position.split('')

    row = position_arr.first.to_i - 1
    col = position_arr.last.to_i - 1
    [row,col]
  end

  def display_current_board
    puts " "
    puts " "
    puts " "
    puts " "
    puts @gameboard[0].join('|')
    puts "------"
    puts @gameboard[1].join('|')
    puts "------"
    puts @gameboard[2].join('|')
  end
end
