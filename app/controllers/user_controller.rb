class UserController < ApplicationController
	before_action :authenticate_user!
	def index
		@title = 'Inicio | Mascotas'
		@pets = Pet.where.not(user_id: current_user.id, adpted: 't').page(params[:page]).per(3)
	end
end
