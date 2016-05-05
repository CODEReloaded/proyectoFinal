json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :age, :specie, :sex, :race, :height, :sterilization, :adpted, :description
  json.url pet_url(pet, format: :json)
end
