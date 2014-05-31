class NeighborhoodsController < ApplicationController
  def index
    @hoods = Neighborhood.all
  end
  
  def show
    @hood = Neighborhood.bn(params[:id])
  end
end