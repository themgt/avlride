class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  
  def hood; neighborhood; end
  
  def title
    "some time #{id}"
  end
end