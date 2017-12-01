require 'square'

describe Square do
  subject(:square) { described_class.new(1) }
  describe '#occupy' do
    it 'has the effect of changing the return value of is_occupied? from false to true' do
      expect(square.is_occupied?).to eq false
      square.occupy
      expect(square.is_occupied?).to eq true
    end
  end
end
