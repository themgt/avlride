class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :rides
  has_many :ride_offers
  
  class << self
    def from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
    
    def neighborhoods
     [
  '',
  'Buncombe',
'- Asheville',
'-- North AVL',
'-- S AVL (Arden/Fletcher)',
'-- East Asheville',
'-- West Asheville',
'- Weaverville',
'- Black Mountain',
'- Swannanoa',
'- Leicester',
'- Enka/Candler',
'- Barnardsville',
'Madison',
'Haywood',
'Hendersonville',
'Other'
]
    end
  end
end