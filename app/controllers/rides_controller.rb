class RidesController < ApplicationController
  before_filter :load_hood
  
  def index
    @rides = Ride.all
  end
  
  def new
    @ride = @hood.rides.new
  end
  
  def show
    @ride = Ride.find(params[:id])
  end
  
  def create
    @ride = current_user.rides.create(permitted_params)
    redirect_to [@ride.hood, @ride], notice: "Ride Created"
  end
  
  protected
  def load_hood
    @hood = Neighborhood.bn(params[:neighborhood_id])
  end
  
  def permitted_params
    params[:ride].permit(:lat_a, :lat_b, :lon_a, :lon_b, :has_car, :leave_at, :return_at, :message, :neighborhood_id)
  end
end