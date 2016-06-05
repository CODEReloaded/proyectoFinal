class User < ActiveRecord::Base
  # Options we are using from devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pets

  acts_as_follower
  acts_as_followable
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  # Uncomment and change for production environment
  validates :given_name, :first_surname, :second_surname, :address, presence: true

  # Validating mobile phone numbers accepts in Mexico
  validates :phone_number, phone: { possible: true, types: [:mobile] }

  # This is for fastness to find other users
  acts_as_mappable :auto_geocode => { :field=>:address, 
          :error_message=>'Direccion invalida, no se puede encontrar la longitud y latitud'},
                   :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

end