class AddStatusToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :status, :integer
  end
end
