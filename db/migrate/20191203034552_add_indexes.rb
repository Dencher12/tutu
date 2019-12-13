class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :trains, :id
    add_index :routes, :id
    add_index :railway_stations, :id
    add_index :tickets, :id
    add_index :cars, %i[id type]
  end
end
