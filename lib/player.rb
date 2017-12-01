class Player
  @@player_count = 0
  attr_reader :id, :occupied_squares
  def initialize
    @@player_count += 1
    @id = @@player_count == 1 ? "O" : "X"
    @occupied_squares = []
  end

  def add_square(square)
    square.occupy
    @occupied_squares << square
  end
end
