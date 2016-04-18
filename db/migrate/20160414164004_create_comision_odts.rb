class CreateComisionOdts < ActiveRecord::Migration
  def change
    create_table :comision_odts do |t|
      t.references :odt, index: true, foreign_key: true, :null => false
      t.references :employee, index: true, foreign_key: true, :null => false
      t.decimal :p_comision, :null => false

      t.timestamps null: false
    end
  end
end
