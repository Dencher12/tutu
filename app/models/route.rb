class Route < ApplicationRecord
  validates :name, presence: true
  has_many :trains
  has_many :routes_railway_stations
  has_many :railway_stations, through: :routes_railway_stations
end
