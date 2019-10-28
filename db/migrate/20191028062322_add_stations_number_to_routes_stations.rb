class AddStationsNumberToRoutesStations < ActiveRecord::Migration[6.0]
  def change
    add_column :routes_railway_stations, :railway_station_number, :integer
  end
end
