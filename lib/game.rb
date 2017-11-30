class Game
  attr_reader :players
  def initialize(player_class)
    @players = []
    2.times { @players << player_class.new }
  end
end
