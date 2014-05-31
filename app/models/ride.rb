class Ride < ActiveRecord::Base
  belongs_to :user
  
  def title
    "some time #{id}"
  end
end