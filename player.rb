class Player
  attr_reader :letter

  def initialize letter
    @letter = letter.upcase
  end
end
