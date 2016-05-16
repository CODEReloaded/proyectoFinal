class Pet < ActiveRecord::Base

	validates :name, :age, :race, :height, :specie, :imagen , presence: true
	validates :sex, presence: { message: "Si es Macho o Hembra" }
	validates :description, presence: { message: "Debe ser algo descriptivo" }
	mount_uploader :imagen, ImageUploader
	validate :image_size_validation 
	private
	def image_size_validation
    	errors[:imagen] << "should be less than 500KB" if imagen.size > 0.5.megabytes
  end
end
