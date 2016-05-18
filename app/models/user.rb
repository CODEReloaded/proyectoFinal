class User < ActiveRecord::Base
  # Options we are using from devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  # Uncomment and change for production environment
  # validates :given_name, :first_surname, :second_surname, :address, presence: true
  validates :given_name, :first_surname, :second_surname, presence: true

  # Validating mobile phone numbers accepts in Mexico
  validates :phone_number, phone: { possible: true, types: [:mobile] }

  # Uncomment this for production
  # geocoded_by :address
  # after_validation :geocode

  #This is for development environment, comment if your are in production
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode 

  # This is for fastness to find other users
  # maybe it will be moved to Pets model
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

end