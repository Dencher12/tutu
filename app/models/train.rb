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

  def cars_sort=(order)
    super(true) if order == :from_head
    super(false) if order == :from_tail
  end

  def cars_sort
    return :from_head if super

    :from_tail
  end

  def sort
    if cars_sort == :from_head
      cars.order('number ASC')
    else
      cars.order('number DESC')
    end
  end
end
