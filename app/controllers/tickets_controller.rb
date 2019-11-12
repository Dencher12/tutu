class TicketsController < ApplicationController
  before_action :set_train, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @tickets = Ticket.new
    @train = Train.find(:train_id)
    @start_station = RailwayStation.find(params[:first_station_id])
    @end_station = RailwayStation.find(params[:last_station_id])
  end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully purchased.'
    else
      render :new
    end
  end

  private

  def set_ticket
    @ticket = Tiket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_station_id,
                                   :last_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport)
  end
end
