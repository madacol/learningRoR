class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :cedula
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.text :address
      t.date :startdate
      t.text :note

      t.timestamps null: false
    end
  end
end
