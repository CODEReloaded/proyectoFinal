class Pet < ActiveRecord::Base

	validates :name, :sex, :description, :age, :race, :height, :specie, presence: true
end
