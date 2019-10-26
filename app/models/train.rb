class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  def get_places(car_type, places_type)
    res = 0
    cars.where(type: car_type).each do |car|
      res += car.send(places_type)
    end

    res
  end

  def sort
    if cars_sort
      cars.order('number ASC')
    else
      cars.order('number DESC')
    end
  end
end
