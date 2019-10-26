class AddCarsSortToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :cars_sort, :boolean
  end
end
