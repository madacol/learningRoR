class CreateRazonSocials < ActiveRecord::Migration
  def change
    create_table :razon_socials do |t|
      t.column :rif_ci, :string, null: false
      t.column :name, :string, null: false
      t.text :description
      t.string :phone
      t.string :email
      t.text :address
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email

      t.timestamps null: false
    end
    add_index :razon_socials, :rif_ci, unique: true
    add_index :razon_socials, :email, unique: true
  end
end
