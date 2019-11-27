class TrainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_train, only: %i[show destroy]

  def index
    @trains = Train.all
  end

  def show; end

  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :current_station_id)
  end
end
