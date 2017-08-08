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
    puts "  1|2|3"
    puts "1 " + @gameboard[0].join('|')
    puts "  ------"
    puts "2 " + @gameboard[1].join('|')
    puts "  ------"
    puts "3 " + @gameboard[2].join('|')
  end

   def check_horizontal?
    @gameboard.each do |row|
      if row.uniq.length == 1 && row.first != ' '
        return true
      end
    end
    return false
  end

  def check_vertical?
    @gameboard.transpose.each do |col|
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
      check_arr << @gameboard[i][i]
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
      check_arr << @gameboard[i][j]
      i += 1
      j -= 1
    end
    if check_arr.uniq.length == 1 && check_arr.first != ' '
      return true
    end
    return false
  end

  def full_board?
    !@gameboard.flatten.any?{|ele| ele == ' '}
  end
end
