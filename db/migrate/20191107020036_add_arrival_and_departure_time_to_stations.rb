class AddArrivalAndDepartureTimeToStations < ActiveRecord::Migration[6.0]
  def change
    add_column :railway_stations, :arrival_time, :datetime
    add_column :railway_stations, :departure_time, :datetime
  end
end
