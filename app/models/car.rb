class Car < ApplicationRecord
  belongs_to :train
  before_create :set_number
  validates :number, uniqueness: { scope: :train_id }

  private

  def set_number
    if train.cars.empty?
      self.number = 1
    else
      self.number = train.cars.last.number + 1
    end
  end
end
