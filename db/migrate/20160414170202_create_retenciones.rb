class CreateRetenciones < ActiveRecord::Migration
  def change
    create_table :retenciones do |t|
      t.string :code_factura, :null => false
      t.references :razon_social, index: true, foreign_key: true, :null => false
      t.integer :tipo, :null => false
      t.decimal :monto, :null => false
      t.text :description
      t.integer :status

      t.timestamps null: false
    end
    add_index :retenciones, :code_factura, unique: true
  end
end
