class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end
  
  def new
    @ride = Ride.new
  end
  
  def show
    @ride = Ride.find(params[:id])
  end
  
  def create
    raise 'woot'
    @ride = current_user.rides.create(permitted_params)
    redirect_to @ride
  end
  
  protected
  def permitted_params
    params[:ride].permit(:lat_a, :lat_b, :lon_a, :lon_b, :has_car, :leave_at, :return_at, :message)
  end
end