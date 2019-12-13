class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :routes_railway_stations
  has_many :routes, through: :routes_railway_stations

  scope :ordered, -> { joins(:routes_railway_stations).order('routes_railway_stations.railway_stations_number').uniq }

  def update_number(route, number)
    route_station = route_station(route)
    route_station.update(railway_station_number: number) if route_station
  end

  def number_in(route)
    route_station(route).try(:railway_station_number)
  end

  protected

  def route_station(route)
    @route_station ||= routes_railway_stations.where(route: route).first
  end
end
