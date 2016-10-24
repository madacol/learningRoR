class CreateCierres < ActiveRecord::Migration
  def change
    create_table :cierres do |t|
      t.integer :account
      t.decimal :total, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
