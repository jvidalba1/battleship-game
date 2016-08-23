class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :user_id
      t.integer :start_coordinate_x
      t.integer :start_coordinate_y
      t.integer :end_coordinate_x
      t.integer :end_coordinate_y

      t.timestamps null: false
    end
  end
end
