# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'hyaoki123@gmail.com', password: 'password1', given_name: 'Jorge', 
	first_surname: 'Ascencio', second_surname: 'Espíndola', phone_number: '5512345678')
user.skip_confirmation!
user.save!