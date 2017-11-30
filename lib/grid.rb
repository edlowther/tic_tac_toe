class Grid
  attr_reader :squares
  def initialize(square_class)
    @squares = []
    9.times { @squares << square_class.new }
  end

  def winning_combinations
    [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
  end
end