require 'game'

describe Game do

  let(:player) { double(:player) }
  let(:player_class) { double(:player_class, :new => player)}

  let(:grid) { double(:grid) }
  let(:grid_class) { double(:grid_class, :new => grid)}

  describe '#new' do

    it 'creates two new players' do
      game = described_class.new(player_class, grid_class)
      expect(player_class).to have_received(:new).twice
    end

    it 'adds the two players to an internal array' do
      game = described_class.new(player_class, grid_class)
      expect(game.players).to eq [player, player]
    end

    it 'creates a new grid' do
      game = described_class.new(player_class, grid_class)
      expect(grid_class).to have_received(:new)
    end

    it 'saves the new grid as an instance variable' do
      game = described_class.new(player_class, grid_class)
      expect(game.grid).to eq grid
    end 
  end
end
