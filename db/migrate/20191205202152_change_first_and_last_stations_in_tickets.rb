class ChangeFirstAndLastStationsInTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :first_station, :string
    remove_column :tickets, :last_station, :string
    add_column :tickets, :first_station_id, :integer
    add_column :tickets, :last_station_id, :integer
  end
end
