class Square
  attr_reader :id
  def initialize(id)
    @id = id
    @occupied = false
  end

  def is_occupied?
    return @occupied
  end

  def occupy
    @occupied = true
  end
end
