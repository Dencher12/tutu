class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: %i[show edit destroy]

  def index
    @tickets = Ticket.all
  end

  def show
    @train = @ticket.train
  end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = User.find(ticket_params[:user_id])
    @ticket.train = Train.find(ticket_params[:train_id])
    @ticket.first_station = @ticket.train.first_station.title
    @ticket.last_station = @ticket.train.last_station.title

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully purchased.'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to search_show_path, notice: 'Ticket was successfully canceled.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_station_id,
                                   :last_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport,
                                   :user_id)
  end
end
