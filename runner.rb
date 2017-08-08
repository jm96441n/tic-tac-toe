require_relative './game'
require_relative './computer'
require_relative './user'

def wanna_play_a_game
  puts "Would you like to play tic-tac-toe? Press Y/N"
  choice = gets.chomp
  case choice.upcase
  when "Y"
    pick_a_letter
  when "N"
    puts "No worries, come again later when you would like to play!"
  else
    puts "Oops, looks like you didn't put in a 'Y' or an 'N', try again with either of those letters"
    wanna_play_a_game
  end
end

def pick_a_letter

  puts "Great! What letter would you like to play as? X or O?"
  letter = gets.chomp
  if letter.upcase != 'X' && letter.upcase != 'O'
    puts "Oops, looks like you didn't pick an 'X' or an 'O', try again"
    pick_a_letter
  else
    begin_game letter
  end
end

def begin_game letter
  case letter.upcase
  when 'X'
    computer = Computer.new('O')
    user     = User.new('X')
  when 'O'
    computer = Computer.new('X')
    user     = User.new('O')
  end
  game = Game.new(computer, user)
  game.play
end

def play_again?
  puts "Good game, want to play again? Y/N"
  choice = gets.chomp.upcase
  until choice.upcase == 'Y' || choice.upcase == 'N'
    puts "Oops, looks like you didn't input a 'Y' or 'N', try again"
    choice = gets.chomp.upcase
  end
  case choice
  when 'Y'
    true
  when 'N'
    false
  end
end

wanna_play_a_game
until !play_again?
  pick_a_letter
end


