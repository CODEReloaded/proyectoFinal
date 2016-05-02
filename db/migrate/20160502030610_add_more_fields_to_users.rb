class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :given_name, :string
    add_column :users, :first_surname, :string
    add_column :users, :second_surname, :string
    add_column :users, :phone_number, :string
  end
end
