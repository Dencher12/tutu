class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :routes_railway_stations
  has_many :routes, through: :routes_railway_stations
end
