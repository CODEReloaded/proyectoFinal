class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :specie
      t.string :sex
      t.string :race
      t.float :height
      t.boolean :sterilization
      t.boolean :adpted
      t.text :description

      t.timestamps null: false
    end
  end
end
