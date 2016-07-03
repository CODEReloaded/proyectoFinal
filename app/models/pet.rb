class Pet < ActiveRecord::Base

	belongs_to :user	

	extend Enumerize
	extend FriendlyId
	
    acts_as_followable    

    friendly_id :id, use: :slugged
	friendly_id :name, use: [:slugged, :finders]

	validates :name, :race, :height, :specie, :imagen, :sex, :longitude, :latitude, presence: true
	validates :age, numericality: { greater_than_or_equal_to: 1 }
	
	validates :description, presence: { message: "Debes dar una descripción de la mascota" }

	
	enumerize :sex, in: [:macho , :hembra]
	enumerize :height, in: [:pequeño, :mediano, :grande]

	mount_uploader :imagen, ImageUploader

	validate :image_size_validation 

	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

	def slug_candidates
      [:name,       	
      	[:name, :id_for_slug],      
      ]
    end

  	def id_for_slug
      generated_slug = normalize_friendly_id(name)
      things = self.class.where('slug LIKE :pattern', pattern: "#{generated_slug}(-[0-9]+)?$")
      things = things.where.not(id: id) unless new_record?
      things.count + 1
  	end
	
	private
	def image_size_validation
    	errors[:imagen] << "should be less than 500KB" if imagen.size > 0.5.megabytes
    end

end
