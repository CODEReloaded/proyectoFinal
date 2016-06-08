class Solicitud < ActiveRecord::Base

	extend Enumerize
	acts_as_followable
	
	validates :nombre, :ocupacion, :por_que, :consideras, :actividades, :vivienda, :dormir, :mudarse,  presence: true
	validates :edad, numericality: { greater_than_or_equal_to: 18 } 
	enumerize :consideras, in: [:compañia, :guardia, :amigo, :familia]
	enumerize :vivienda, in: [:casa, :departamento]
	enumerize :dormir, in:[:jardin, :patio, :azotea, :casa]

	
end
