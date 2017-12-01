require 'player'

describe Player do
  subject(:player) { described_class.new }
  let(:square) { double(:square, :occupy => true) }
  describe '#new' do
    player1 = Player.new
    player2 = Player.new
    it 'first player is assigned an id of "O"' do
      expect(player1.id).to eq "O"
    end
    it 'second player is assigned an id of "X"' do
      expect(player2.id).to eq "X"
    end
  end

  describe '#add_square' do
    it 'pushes a square object to the instance\'s occupied_squares array' do
      player.add_square(square)
      expect(player.occupied_squares.first).to eq square
    end
  end
end
