class Game
  attr_reader :players, :grid
  def initialize(player_class, grid_class)
    @players = []
    2.times { @players << player_class.new }
    @grid = grid_class.new
  end
end
