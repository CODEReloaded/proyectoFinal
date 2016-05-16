class AddMyColumnToPet < ActiveRecord::Migration
  def change
    add_column :pets, :imagen, :string
  end
end
