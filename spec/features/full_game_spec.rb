require 'game'

describe 'Gameplay' do
  describe 'taking turns' do
    it 'alternates between players after each square selection' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      game.select_square(1)
      expect(player1.occupied_squares.length).to eq 1
      expect(player2.occupied_squares.length).to eq 0
      game.select_square(2)
      expect(player1.occupied_squares.length).to eq 1
      expect(player2.occupied_squares.length).to eq 1
      game.select_square(3)
      expect(player1.occupied_squares.length).to eq 2
      expect(player2.occupied_squares.length).to eq 1
    end
  end

  describe 'selecting same square twice' do
    it 'is impossible' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      game.select_square(7)
      game.select_square(7)
      expect(player1.occupied_squares.length).to eq 1
      expect(player2.occupied_squares.length).to eq 0
    end
    it 'allows bungling player to have a second go' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      game.select_square(7)
      game.select_square(7)
      expect(player1.occupied_squares.length).to eq 1
      expect(player2.occupied_squares.length).to eq 0
      game.select_square(8)
      expect(player1.occupied_squares.length).to eq 1
      expect(player2.occupied_squares.length).to eq 1
    end
  end
end
