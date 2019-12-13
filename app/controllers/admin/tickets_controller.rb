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
    @ticket.first_station_id = ticket_params[:first_station_id]
    @ticket.last_station_id = ticket_params[:last_station_id]
    if @ticket.save
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully purchased.'
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
