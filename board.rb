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

    @gameboard[position_arr.first] ? @gameboard[position_arr.first][position_arr.last] != ' ' : false
  end

  def valid_move? position
    position_arr = split_and_format_position position

    !!(@gameboard[position_arr.first] && @gameboard[position_arr.first][position_arr.last])
  end

  def split_and_format_position position
    position_arr = position.split('')

    row = position_arr.first.to_i - 1
    col = position_arr.last.to_i - 1
    [ row, col ]
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

  def check_straight_line?
    board = @gameboard.transpose + @gameboard

    board.each do |row|
      if row.uniq.length == 1 && row.first != ' '
          return true
        end
      end
    return false
  end

  def check_diagonal? direction
    check_arr = []
    board     = direction == 'left' ? @gameboard : @gameboard.map{ |ele| ele.reverse}

    board.collect.with_index do |row, idx|
      check_arr << row[idx]
    end
    check_arr.uniq.length == 1 && check_arr.first != ' '
  end

  def full_board?
    !@gameboard.flatten.any?{|ele| ele == ' '}
  end
end
