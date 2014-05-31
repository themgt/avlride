class Neighborhood < ActiveRecord::Base
  has_many :rides
  
  def self.bn(slug)
    where(slug: slug).first
  end
  
  def to_param
    slug
  end
end