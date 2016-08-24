class Turn < ActiveRecord::Base
  belongs_to :user
  
  enum status: [:guessed, :lost]

  def attack_opponent
    user.opponent.ships.reject(&:sunk?).each do |ship|
      byebug
      if ship.touched?(coordinate_x, coordinate_y)
        ship.sunk!
      else
        ship.active!
      end
    end
    user.opponent.ships.any?(&:sunk?) ? self.guessed! : self.lost!
  end
end
