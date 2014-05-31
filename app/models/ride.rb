class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  
  def hood; neighborhood; end
end