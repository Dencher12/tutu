class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :kind
      t.integer :top_places
      t.integer :lower_places
      t.belongs_to :train
      t.timestamps
    end
  end
end
