class UserController < ApplicationController
	before_action :authenticate_user!
	def index
		@title = 'Inicio | Mascotas'
		@pets = Pet.all
	end
end
