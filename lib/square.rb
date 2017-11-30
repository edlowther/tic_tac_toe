class Square
  @@square_count = 0
  attr_reader :id
  def initialize
    @@square_count += 1
    @id = @@square_count
    @occupied = false
  end

  def is_occupied?
    return @occupied
  end

  def occupy
    @occupied = true
  end 
end
