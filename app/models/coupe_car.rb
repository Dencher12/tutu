class CoupeCar < Car
  validates :top_places, :bottom_places, presence: true
end
