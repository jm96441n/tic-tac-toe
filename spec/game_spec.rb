require_relative '../game'
require_relative '../player'
require_relative '../board'

describe Game do
  let(:computer) { Player.new('X') }
  let(:player)   { Player.new('O') }
  let(:game)     { Game.new(computer, player ) }
  let(:board)    { game.board}

  it 'starts a game with an empty board' do
    expect(board).to eql([[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']])
  end

  it 'starts the game with a computer and human player' do
    expect(game.user).to eql(player)

    expect(game.computer).to eql(computer)
  end

  it 'initializes with the current player who picked "X"' do
    expect(game.current_player).to eql(computer)
  end

  it 'switches the current player' do
    game.switch_current_player

    expect(game.current_player).to eql(player)
  end

  it 'checks for a horizontal win' do
    loser   = [['X','X',' '],[' ',' ',' '], [' ',' ',' ']]
    winner1 = [['X','X','X'],[' ',' ',' '], [' ',' ',' ']]
    winner2 = [[' ',' ',' '],['X','X','X'], [' ',' ',' ']]
    winner3 = [[' ',' ',' '],[' ',' ',' '], ['X','X','X']]

    game.board = loser

    expect(game.won?).to eql(false)

    game.board = winner1

    expect(game.won?).to eql(true)

    game.board = winner2

    expect(game.won?).to eql(true)

    game.board = winner3

    expect(game.won?).to eql(true)
  end

  it 'checks for a vertical win' do
    loser   = [['X',' ',' '],['X',' ',' '], [' ',' ',' ']]
    winner1 = [['X',' ',' '],['X',' ',' '], ['X',' ',' ']]
    winner2 = [[' ','X',' '],[' ','X',' '], [' ','X',' ']]
    winner3 = [[' ',' ','X'],[' ',' ','X'], [' ',' ','X']]

    game.board = loser

    expect(game.won?).to eql(false)

    game.board = winner1

    expect(game.won?).to eql(true)

    game.board = winner2

    expect(game.won?).to eql(true)

    game.board = winner3

    expect(game.won?).to eql(true)
  end

  it 'checks for a diagonal win' do
    loser   = [['X',' ',' '],[' ',' ',' '], [' ',' ','X']]
    winner1 = [['X',' ',' '],[' ','X',' '], [' ',' ','X']]
    winner2 = [[' ',' ','X'],[' ','X',' '], ['X',' ',' ']]

    game.board = loser

    expect(game.won?).to eql(false)

    game.board = winner1

    expect(game.won?).to eql(true)

    game.board = winner2

    expect(game.won?).to eql(true)
  end
end
