require_relative '../user'

describe User do
  let(:user)  { User.new('X') }
  let(:board) { Board.new() }

  before do
    allow($stdout).to receive(:write).and_return('')
  end

  it 'allows a user to pick a space on the board' do
    allow(user).to receive(:get_input).and_return('1,2')

    user.make_move board

    expect(board.gameboard).to eql([[' ','X',' '],[' ',' ',' '], [' ',' ',' ']])
  end

end
