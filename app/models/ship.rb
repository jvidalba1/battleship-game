class Ship < ActiveRecord::Base
  belongs_to :user

  enum state: [ :active, :sunk ]

  def touched?(x, y)
    range_x.include?(x) && range_y.include?(y)
  end

  private

  def range_x
    (start_coordinate_x..end_coordinate_x)
  end

  def range_y
    (start_coordinate_y..end_coordinate_y)
  end
end
