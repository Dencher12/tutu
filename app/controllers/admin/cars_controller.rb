class Admin::CarsController < Admin::BaseController
  before_action :set_train, only: %i[new create]
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = @train.cars.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def car_params
    params.require(:car).permit(:type, :top_places, :bottom_places, :top_side_places, :bottom_side_places, :train_id)
  end
end