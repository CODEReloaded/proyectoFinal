class Pet < ActiveRecord::Base

	extend Enumerize

	belongs_to :user

	validates :name, :race, :height, :specie, :imagen, :sex, presence: true
	validates :age, numericality: { greater_than_or_equal_to: 1 }
	
	validates :description, presence: { message: "Debe ser algo descriptivo" }

	enumerize :sex, in: [:macho, :hembra]

	mount_uploader :imagen, ImageUploader
	validate :image_size_validation 
	
	private
	def image_size_validation
    	errors[:imagen] << "should be less than 500KB" if imagen.size > 0.5.megabytes
  end
end
