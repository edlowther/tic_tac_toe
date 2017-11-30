require 'square'

describe Square do
  subject(:square) { described_class.new }
  describe '#new' do
    square1 = described_class.new
    square2 = described_class.new
    square3 = described_class.new
    it 'assigns an id of 1 to the first square' do
      expect(square1.id).to eq 1
    end
    it 'assigns an id of 2 to the second square' do
      expect(square2.id).to eq 2
    end
    it 'assigns an id of 3 to the thid square' do
      expect(square3.id).to eq 3
    end
  end
  describe '#occupy' do
    it 'has the effect of changing the return value of is_occupied? from false to true' do
      expect(square.is_occupied?).to eq false
      square.occupy
      expect(square.is_occupied?).to eq true
    end
  end
end
