require_relative '../computer'

describe Computer do
  let(:computer)  { Computer.new('X') }
  let(:board) { Board.new() }

  it 'allows the computer to pick a random space on the board' do

    computer.make_move board

    expect(board.gameboard.flatten.any?{ |ele| ele == 'X' }).to be true
  end
end
