require_relative '../board'

describe Board do
  let(:board) { Board.new }

  it 'creates a 3x3 board' do
    expect(board.board).to eql([[' ',' ',' '],[' ',' ',' '], [' ',' ',' ']])
  end
end
