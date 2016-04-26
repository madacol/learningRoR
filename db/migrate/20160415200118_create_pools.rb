class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.references :odt, index: true, foreign_key: true
      t.references :gg, index: true, foreign_key: true
      t.references :inversion, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :retencione, index: true, foreign_key: true
      t.integer :cuenta
      t.integer :comprobante_type
      t.string :n_comprobante
      t.decimal :monto, :precision => 15, :scale => 2
      t.decimal :balance, :precision => 15, :scale => 2
      t.text :description

      t.timestamps null: false
    end
  end
end
