class Ship < ActiveRecord::Base
  belongs_to :user

  enum state: [ :active, :sunk ]

  MAX_SIZE_BOARD = 10
  SHIP_SIZE = 3

  def touched?(x, y)
    range_x.include?(x) && range_y.include?(y)
  end

  # all ships of 3 positions
  def populate
    self.start_coordinate_x = rand(11)
    self.start_coordinate_y = rand(11)
    if ship_position == 'vertical'
      self.end_coordinate_x = self.start_coordinate_x
      self.end_coordinate_y = (self.start_coordinate_y + SHIP_SIZE) > MAX_SIZE_BOARD ? (self.start_coordinate_y - SHIP_SIZE) : (self.start_coordinate_y + SHIP_SIZE)
    else
      self.end_coordinate_y = self.start_coordinate_y
      self.end_coordinate_x = (self.start_coordinate_x + SHIP_SIZE) > MAX_SIZE_BOARD ? (self.start_coordinate_x - SHIP_SIZE) : (self.start_coordinate_x + SHIP_SIZE)
    end
  end

  def ship_position
    ["vertical", "horizontal"].shuffle.first
  end

  private

  def range_x
    if start_coordinate_x < end_coordinate_x
      (start_coordinate_x..end_coordinate_x) 
    else
      (end_coordinate_x..start_coordinate_x)
    end
  end

  def range_y
    if start_coordinate_y < end_coordinate_y
      (start_coordinate_y..end_coordinate_y)
    else
      (end_coordinate_y..start_coordinate_y)
    end
  end
end
