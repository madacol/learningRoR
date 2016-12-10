class RemoveUniqueToRif < ActiveRecord::Migration
  def up
    remove_index :razon_socials, :rif_ci
    remove_index :razon_socials, :email
  end
  def down
    add_index :razon_socials, :rif_ci, unique: true
    add_index :razon_socials, :email, unique: true
  end
end
