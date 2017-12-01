class Square
  attr_reader :id, :occupied_by
  def initialize(id)
    @id = id
    @occupied = false
    @occupied_by = 'n/a'
  end

  def is_occupied?
    return @occupied
  end

  def occupy(player_id)
    @occupied = true
    @occupied_by = player_id
  end
end
