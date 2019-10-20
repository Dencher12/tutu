class Car < ApplicationRecord
  validates :kind, presence: true
  belongs_to :train
end