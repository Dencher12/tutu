class Car < ApplicationRecord
  belongs_to :train
  before_create :set_number
  validates :number, uniqueness: { scope: :train_id }

  private

  def set_number
    self.number = train.cars.count + 1
  end
end
