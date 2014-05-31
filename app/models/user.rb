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
      ['', 'Albemarle Park',
      'Ballentree',
      'Bear Creek',
      'Beaverdam Run',
      'Beverly Hills',
      'Biltmore Park',
      'Biltmore South',
      'Birch Forest',
      'Blake Mountain',
      'Brucemont/Louisiana ',
      'Bull Mountain',
      'Burton Street',
      'Charlotte Street',
      'Chestnut Hills',
      'Cimarron',
      'Claxton Community',
      'Cloister Condominiums',
      'Crowfields Condominiums',
      'DARN',
      'Deaverview',
      'Deer Run',
      'Deerwood',
      'Devonshire ',
      'East End/Valley Street',
      'East View Association',
      'East West Asheville',
      'Erskine-Walton',
      'Falconhurst',
      'Five Points',
      'Grace',
      'Grove Park/Sunset',
      'Hall Fletcher',
      'Haw Creek',
      'Henrietta/Spears Street',
      'Hillcrest',
      'Historic Montford',
      'Jackson Park',
      'Kenilworth',
      'Kenilworth Forest',
      'Lakeview Park',
      'Lee Walker Heights',
      'Livingston Heights',
      'Lucerne Park',
      'Malvern Hills',
      'Morningside Park',
      'Mountainbrook',
      'Murdock/Linden',
      'North Asheville Community',
      'Norwood Park',
      'Oak Forest',
      'Oakley',
      'Park Avenue',
      'Parkway Forest',
      'Pebble Creek',
      'Pisgah View ',
      'Redwood Forest',
      'Riverview',
      'Shiloh',
      'Sondley Estates',
      'South French Broad',
      'South Oaks Townhomes',
      'Spring Forest Cr',
      'St. Dunstans',
      'The Views of Asheville',
      'Upper Malvern Hills',
      'View Point',
      'Virginia Avenue',
      'WECAN',
      'Walton-Oakland',
      'West Asheville Estates',
      'Wilshire Park']
    end
  end
end