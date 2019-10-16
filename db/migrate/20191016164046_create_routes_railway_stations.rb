class CreateRoutesRailwayStations < ActiveRecord::Migration[6.0]
  def change
    create_table :routes_railway_stations do |t|
      t.integer :route_id
      t.integer :railway_station_id
    end
  end
end
