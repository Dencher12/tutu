class SearchController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def results
    @trains = Search.search(params[:first_station][:id], params[:last_station][:id])
  end

  private

  def search_params
    params.require(:first_station).permit(:id)
    params.require(:last_station).permit(:id)
  end
end
