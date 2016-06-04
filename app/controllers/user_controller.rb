class UserController < ApplicationController
	before_action :authenticate_user!
	def index
		@title = 'Inicio | Mascotas'
		#@pets = Pet.all
		@pets = Pet.where(adpted: 'f').page(params[:page]).per(3)
	end
end
