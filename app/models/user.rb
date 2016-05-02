class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  validates :phone_number, format: { with: /\d{4}-\d{4}|\d{2}-\d{4}-\d{4}/, 
  			message: "el formato es 1234-5678 ó 55-1234-5678"}

  validates_presence_of :given_name, :first_surname, :second_surname, :phone_number
end
