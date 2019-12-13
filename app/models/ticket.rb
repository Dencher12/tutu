class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train, optional: true

  after_create :send_buy_notice
  after_destroy :send_cancel_notice

  def first_station
    RailwayStation.find(first_station_id)
  end

  def last_station
    RailwayStation.find(last_station_id)
  end

  def send_buy_notice
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_cancel_notice
    TicketsMailer.cancel_ticket(user, self).deliver_now
  end
end
