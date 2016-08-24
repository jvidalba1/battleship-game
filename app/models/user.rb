class User < ActiveRecord::Base
  has_many :ships, dependent: :destroy
  has_many :turns, dependent: :destroy
  belongs_to :game

  def is_my_turn?
    opponent.present? && (first_user_in_room? || hit_last_turn? || opponent_guessed_wrong?)
  end

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

  def hit_last_turn?
    turns.any? && turns.last.guessed?
  end

  private 

  def first_user_in_room?
    turns.none? && id < opponent.id
  end

  def opponent_guessed_wrong?
    opponent.turns.any? && !opponent.hit_last_turn? && (turns.none? || turns.last.id < opponent.turns.last.id)
  end

end
