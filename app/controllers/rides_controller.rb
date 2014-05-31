class RidesController < ApplicationController
  before_filter :load_hood
  before_filter :load_ride, only: [:show, :edit, :update]
  def index
    @rides = Ride.all
  end
  
  def new
    @ride = @hood.rides.new
  end
  
  def create
    @ride = current_user.rides.create(permitted_params)
    redirect_to [@ride.hood, @ride], notice: "Ride Created"
  end
  
  def update
    @ride.update_attributes(permitted_params)
    redirect_to [@ride.hood, @ride], notice: "Ride Updated"
  end
  
  protected
  def load_ride
    @ride = @hood.rides.find(params[:id])
  end
  
  def load_hood
    @hood = Neighborhood.bn(params[:neighborhood_id])
  end
  
  def permitted_params
    params[:ride].permit(:lat_a, :lat_b, :lon_a, :lon_b, :has_car, 
      :leave_on, :timespan, :title, :message, :neighborhood_id)
  end
end