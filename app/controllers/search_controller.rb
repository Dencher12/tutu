class SearchController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def results
    @trains = Search.search(search_params[:first_station_id],
                            search_params[:last_station_id])

    @first_station_id = search_params[:first_station_id]
    @last_station_id = search_params[:last_station_id]
  end

  private

  def search_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end
