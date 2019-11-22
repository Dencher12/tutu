class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @train = @ticket.train
  end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.train = Train.find(ticket_params[:train_id])

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully purchased.'
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:first_station_id,
                                   :last_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport)
  end
end
