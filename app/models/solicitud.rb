class Solicitud < ActiveRecord::Base

	extend Enumerize
	extend FriendlyId

	belongs_to :user
	acts_as_followable
	
	validates :nombre, :ocupacion, :por_que, :consideras, :experiencia, :actividades, :gastos, :vivienda, :dormir, :mudarse, :ajuste, presence: true
	validates :edad, numericality: { greater_than_or_equal_to: 18 } 
	enumerize :consideras, in: [:compañia, :guardia, :amigo, :familia]
	enumerize :vivienda, in: [:casa, :departamento]
	enumerize :dormir, in:[:jardin, :patio, :azotea, :casa]

	
end
