class Ship < ActiveRecord::Base
  belongs_to :user

  enum state: [ :active, :sunk ]

  MAX_LENGTH_BOARD = 10
  SHIP_LENGTH = 3

  def touched?(x, y)
    range_x.include?(x) && range_y.include?(y)
  end

  # all ships of 3 positions
  def populate
    self.start_coordinate_x = rand(11)
    self.start_coordinate_y = rand(11)
    if ship_position == 'vertical'
      self.end_coordinate_x = self.start_coordinate_x
      self.end_coordinate_y = (self.start_coordinate_y + SHIP_LENGTH) > MAX_LENGTH_BOARD ? (self.start_coordinate_y - SHIP_LENGTH) : (self.start_coordinate_y + SHIP_LENGTH)
    else
      self.end_coordinate_y = self.start_coordinate_y
      self.end_coordinate_x = (self.start_coordinate_x + SHIP_LENGTH) > MAX_LENGTH_BOARD ? (self.start_coordinate_x - SHIP_LENGTH) : (self.start_coordinate_x + SHIP_LENGTH)
    end
  end

  def ship_position
    ["vertical", "horizontal"].shuffle.first
  end

  private

  def range_x
    (start_coordinate_x..end_coordinate_x)
  end

  def range_y
    (start_coordinate_y..end_coordinate_y)
  end
end
