require_relative '../game'
require_relative '../player'
require_relative '../board'

describe Game do
  let(:computer) { Player.new('X') }
  let(:player)   { Player.new('O') }
  let(:game)     { Game.new(computer, player ) }

  it 'starts a game with an empty board' do
    expect(game.board.gameboard).to eql([[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']])
  end
end
