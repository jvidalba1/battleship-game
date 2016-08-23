class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :coordinate_x
      t.integer :coordinate_y
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
