class AddMyColunmToSolicitud < ActiveRecord::Migration
  def change
    add_column :solicituds, :id_pet, :integer
  end
end
