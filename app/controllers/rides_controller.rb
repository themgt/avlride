class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end
  
  def new
    @ride = Ride.new
  end
end