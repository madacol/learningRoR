class CreateInversions < ActiveRecord::Migration
  def change
    create_table :inversions do |t|
      t.string :code, :null => false
      t.text :description, :null => false

      t.timestamps null: false
    end
    add_index :inversions, :code, unique: true
  end
end
