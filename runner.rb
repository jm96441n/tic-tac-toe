require_relative './board'
require_relative './game'
require_relative './player'

def wanna_play_a_game
  puts "Would you like to play tic-tac-toe? Press Y/N"
  choice = gets.chomp
  case choice.upcase
  when "Y"
    puts "Great! What letter would you like to play as? X or O?"
    letter = gets.chomp
    begin_game letter
  when "N"
    puts "No worries, come again later when you would like to play!"
  end
end

def begin_game letter
  case letter.upcase
  when "X"
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


