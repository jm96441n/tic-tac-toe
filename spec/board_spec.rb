require_relative '../board'

describe Board do
  let(:board) { Board.new }

  it 'creates a 3x3 board' do
    expect(board.board).to eql([[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']])
  end

  it 'allows a player to take a position' do
    board.take_position 'X', "0,1"

    expect(board.board[0][1]).to eql('X')
  end
end
