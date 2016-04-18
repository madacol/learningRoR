class CreateOdts < ActiveRecord::Migration
  def change
    create_table :odts do |t|
      t.string :code, :null => false
      t.text :description, :null => false
      t.references :razon_social, index: true, foreign_key: true, :null => false
      t.decimal :monto_contrato, :null => false

      t.timestamps null: false
    end
    add_index :odts, :code, unique: true
  end
end
