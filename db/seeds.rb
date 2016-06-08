# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'hyaoki123@gmail.com', password: 'password1', given_name: 'Jorge', 
	first_surname: 'Ascencio', second_surname: 'Espíndola', phone_number: '+5215512345678', 
	address: 'Gabriel Ramos Millan 6, Nativitas, 03500 Ciudad de México, D.F.')
user.skip_confirmation!
user.save!


aven = ['Calzada de Tlalpan ', 'Calzada del hueso ', 'Insurgentes ']

count = 0
while count < 4
  r = Random.rand(100...3060) 
  k = Random.rand(-1...3)
  user = User.new(email: FFaker::Internet.free_email, password: 'password', 
  	given_name: FFaker::NameMX.name, first_surname: FFaker::NameMX.last_name, 
  	second_surname: FFaker::NameMX.last_name, 
  	phone_number: FFaker::PhoneNumberMX.international_mobile_phone_number, 
  	address: aven[k]+ r.to_s + ', Ciudad de México' )
  user.skip_confirmation!
  user.save!
  count = count + 1
end

# user = User.new(email: FFaker::Internet.free_email, password: 'password', given_name: FFaker::NameMX.name, first_surname: FFaker::NameMX.last_name,  second_surname: FFaker::NameMX.last_name, phone_number: FFaker::PhoneNumberMX.international_mobile_phone_number, latitude: FFaker::Geolocation.lat, longitude: FFaker::Geolocation.lng)