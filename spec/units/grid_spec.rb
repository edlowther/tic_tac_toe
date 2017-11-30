require 'grid'

describe Grid do
  subject(:grid) { described_class.new(square_class) }
  let(:square) { double(:square) }
  let(:square_class) { double(:square_class, :new => square)}
  describe '#new' do
    it 'creates nine new squares' do
      grid = described_class.new(square_class)
      expect(square_class).to have_received(:new).exactly(9).times
    end

    it 'stores the squares in an instance variable called squares' do
      expect(grid.squares.first).to eq square
    end
  end

  describe '#winning_combinations' do
    it 'returns an array of arrays with all possible routes to victory' do
      expect(grid.winning_combinations).to include [1,2,3]
      expect(grid.winning_combinations).to include [4,5,6]
      expect(grid.winning_combinations).to include [7,8,9]
      expect(grid.winning_combinations).to include [1,4,7]
      expect(grid.winning_combinations).to include [2,5,8]
      expect(grid.winning_combinations).to include [3,6,9]
      expect(grid.winning_combinations).to include [1,5,9]
      expect(grid.winning_combinations).to include [3,5,7]
    end
  end
end
