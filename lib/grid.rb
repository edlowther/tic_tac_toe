require 'square'

class Grid
  attr_reader :squares
  def initialize(square_class=Square)
    @squares = []
    (1..9).each { |id| @squares << square_class.new(id) }
  end

  def get_square_by_id(id)
    @squares[id - 1]
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
