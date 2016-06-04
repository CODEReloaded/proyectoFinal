class AddMyColunmToPet < ActiveRecord::Migration
  def change
    add_column :pets, :new_owner, :integer
  end
end
