require_relative './board'
require_relative './game'
require_relative './player'
require 'pry'
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
    computer = Player.new('O')
    user     = Player.new('X')
  when 'O'
    computer = Player.new('X')
    user     = Player.new('O')
  end
  game = Game.new(computer, user)
  game.play
end

wanna_play_a_game


