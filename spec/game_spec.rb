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

  it 'starts the game with a computer and human player' do
    expect(game.user).to eql(player)

    expect(game.computer).to eql(computer)
  end

  it 'initializes with the current player who picked "X"' do
    expect(game.current_player).to eql(computer)
  end
end
