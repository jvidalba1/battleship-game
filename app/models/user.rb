class User < ActiveRecord::Base
  has_many :ships
  has_many :turns
  belongs_to :game

  # after_commit :build_ships

  # burned positions
  def build_ships
    self.ships.build(start_coordinate_x: 8,
      start_coordinate_y: 4, 
      end_coordinate_x: 8, 
      end_coordinate_y: 8
    )
  end

  def opponent
    game.users.reject {|u| u.id == self.id }.first
  end
end
