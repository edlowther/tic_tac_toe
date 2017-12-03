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
    it 'is impossible to take a turn if the game is over' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      game.select_square(5)
      game.select_square(6)
      game.select_square(9)
      game.select_square(3)
      game.select_square(1)
      expect(player1.has_won?).to be true
      expect(player2.occupied_squares.length).to eq 2
      game.select_square(4)
      expect(player2.occupied_squares.length).to eq 2
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

  describe 'winning' do
    it 'is possible on a diagonal' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      expect(player1.has_won?).to be false
      game.select_square(5)
      expect(player1.has_won?).to be false
      game.select_square(6)
      expect(player1.has_won?).to be false
      game.select_square(9)
      expect(player1.has_won?).to be false
      game.select_square(3)
      expect(player1.has_won?).to be false
      game.select_square(1)
      expect(player1.has_won?).to be true
    end
    it 'is possible on a horizontal' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      expect(player2.has_won?).to be false
      game.select_square(5)
      expect(player2.has_won?).to be false
      game.select_square(8)
      expect(player2.has_won?).to be false
      game.select_square(4)
      expect(player2.has_won?).to be false
      game.select_square(9)
      expect(player2.has_won?).to be false
      game.select_square(1)
      game.select_square(7)
      expect(player2.has_won?).to be true
    end
    it 'is possible on a vertical' do
      game = Game.new
      player1 = game.players[0]
      player2 = game.players[1]
      expect(player2.has_won?).to be false
      game.select_square(5)
      expect(player2.has_won?).to be false
      game.select_square(1)
      expect(player2.has_won?).to be false
      game.select_square(6)
      expect(player2.has_won?).to be false
      game.select_square(4)
      expect(player2.has_won?).to be false
      game.select_square(2)
      game.select_square(7)
      expect(player2.has_won?).to be true
    end
  end

  describe 'drawing' do
    it 'is possible' do
      game = Game.new
      [1,2,3,4,6,5,7,9].each do |square_id|
        game.select_square(square_id)
        expect(game.is_over?).to eq false
      end
      game.select_square(8)
      expect(game.is_over?).to eq true
    end
  end
end
