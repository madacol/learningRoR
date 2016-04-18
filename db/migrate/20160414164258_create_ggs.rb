class CreateGgs < ActiveRecord::Migration
  def change
    create_table :ggs do |t|
      t.string :code, :null => false
      t.text :description, :null => false

      t.timestamps null: false
    end
    add_index :ggs, :code, unique: true
  end
end
