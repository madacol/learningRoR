class CreateDeduccionesOdts < ActiveRecord::Migration
  def change
    create_table :deducciones_odts do |t|
      t.references :odt, index: true, foreign_key: true, :null => false
      t.string :name, :null => false
      t.decimal :p_gasto, :null => false

      t.timestamps null: false
    end
  end
end
