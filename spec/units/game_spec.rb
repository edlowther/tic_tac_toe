require 'game'

describe Game do

  let(:player) { double(:player) }
  let(:player_class) { double(:player_class, :new => player)}

  describe '#new' do

    it 'creates two new players' do
      game = described_class.new(player_class)
      expect(player_class).to have_received(:new).twice
    end

    it 'adds the two players to an internal array' do
      game = described_class.new(player_class)
      expect(game.players).to eq [player, player]
    end
  end
end
