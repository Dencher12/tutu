class Search < ApplicationRecord
  def self.search(first_station_id, last_station_id)
    first_station_routes = RailwayStation.find(first_station_id.to_i).routes
    last_station_routes = RailwayStation.find(last_station_id.to_i).routes

    routes = first_station_routes & last_station_routes

    trains = []
    routes.each do |route|
      trains += route.trains
    end
    trains
  end
end
