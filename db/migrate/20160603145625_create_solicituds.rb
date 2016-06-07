class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.string :nombre
      t.string :ocupacion
      t.integer :edad
      t.text :por_que
      t.string :consideras
      t.boolean :experiencia
      t.text :actividades
      t.boolean :gastos
      t.string :vivienda
      t.string :dormir
      t.text :mudarse
      t.boolean :ajuste

      t.timestamps null: false
    end
  end
end
