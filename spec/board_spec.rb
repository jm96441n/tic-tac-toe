require_relative '../board'

describe Board do
  let(:board) { Board.new }

  it 'creates a 3x3 board' do
    expect(board.gameboard).to eql([[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']])
  end

  it 'allows a player to take a position' do
    board.take_position 'X', '1,2'

    expect(board.gameboard[0][1]).to eql('X')
  end

  it 'can check that a position is taken' do
    board.take_position 'X', '1,2'

    expect(board.space_taken?('1,2')).to be true
  end
end
