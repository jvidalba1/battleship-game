class Turn < ActiveRecord::Base
  belongs_to :user
  
  def attack_opponent
    user.opponent.ships.each do |ship| 
      if ship.touched?(coordinate_x, coordinate_y)
        ship.sunk!
      end
    end
  end
end
