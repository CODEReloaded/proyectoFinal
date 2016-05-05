class Pet < ActiveRecord::Base

	validates :name, :age, :race, :height, :specie, presence: true
	validates :sex, presence: { message: "Si es Macho o Hembra" }
	validates :description, presence: { message: "Debe ser algo descriptivo" }
end
