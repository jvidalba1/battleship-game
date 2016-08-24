class User < ActiveRecord::Base
  has_many :ships
  has_many :turns
  belongs_to :game

  # after_commit :build_ships

  # 5 ships per user
  def build_ships
    5.times do
      ship = self.ships.build
      ship.populate
    end
  end

  def opponent
    game.users.reject {|u| u.id == self.id }.first
  end
end
