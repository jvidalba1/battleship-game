class AddStateToShips < ActiveRecord::Migration
  def change
    add_column :ships, :state, :integer
  end
end
