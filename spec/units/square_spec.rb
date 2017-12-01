require 'square'

describe Square do
  let(:player) { double(:player, :id => "X") }
  subject(:square) { described_class.new(1) }
  describe '#occupy' do
    it 'has the effect of changing the return value of is_occupied? from false to true' do
      expect(square.is_occupied?).to eq false
      square.occupy(player.id)
      expect(square.is_occupied?).to eq true
    end
    it 'has the effect of changing the return value of occupied_by from "n/a" to either "O" or "X"' do
      expect(square.occupied_by).to eq 'n/a'
      square.occupy(player.id)
      expect(square.occupied_by).to eq "X" 
    end
  end
end
