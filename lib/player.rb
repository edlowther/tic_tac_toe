class Player
  @@player_count = 0
  attr_reader :id, :occupied_squares
  def initialize
    @@player_count += 1
    @id = @@player_count == 1 ? "O" : "X"
    @occupied_squares = []
    @has_won = false
  end

  def add_square(square)
    square.occupy(@id)
    @occupied_squares << square
  end

  def has_won?
    @has_won
  end

  def check_if_won(winning_combinations)
    winning_combinations.each do |combination|
      square_in_combo_count = 0
      @occupied_squares.each do |square|
        if combination.include?(square.id)
          square_in_combo_count += 1
        end
      end
      if square_in_combo_count == 3
        @has_won = true
        break
      end
    end
  end
end
