require_relative '../player'

describe Player do
  let(:player) { Player.new('X') }

  it 'assigns a letter for the player to use' do
    expect(player.letter).to eql('X')
  end
end
