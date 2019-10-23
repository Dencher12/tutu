class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :type

      t.integer :top_places
      t.integer :bottom_places
      t.integer :top_side_places
      t.integer :bottom_side_places
      t.integer :seat_places

      t.belongs_to :train
      t.timestamps
    end
  end
end
