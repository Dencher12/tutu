class RoutesRailwayStation < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  default_scope -> { order(:railway_station_number) }
end
