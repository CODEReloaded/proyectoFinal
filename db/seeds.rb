# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'hyaoki123@gmail.com', password: 'password1', given_name: 'Jorge', 
	first_surname: 'Ascencio', second_surname: 'Espíndola', phone_number: '55-1234-5678', 
	address: 'Gabriel Ramos Millan 6, Nativitas, 03500 Ciudad de México, D.F.')
user.skip_confirmation!
user.save!
user = User.new(email: 'kuberjorg3n@hotmail.com', password: 'password2', given_name: 'Juancho', 
	first_surname: 'Perez', second_surname: 'Fasser', phone_number: '55-1654-4578', 
	address: 'Sierra San Juan 54, María Esther Zuno de Echeverría, Ciudad de México, D.F.')
user.skip_confirmation!
user.save!