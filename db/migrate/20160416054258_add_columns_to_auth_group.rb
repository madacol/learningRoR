class AddColumnsToAuthGroup < ActiveRecord::Migration
  def change
	  add_column :auth_groups, :odt, :boolean, null: false, default: false
	  add_column :auth_groups, :gg, :boolean, null: false, default: false 
	  add_column :auth_groups, :inversion, :boolean, null: false, default: false 
	  add_column :auth_groups, :employee, :boolean, null: false, default: false 
	  add_column :auth_groups, :retencione, :boolean, null: false, default: false 
	  add_column :auth_groups, :pool, :boolean, null: false, default: false 
	  add_column :auth_groups, :razon_social, :boolean, null: false, default: false 
	  add_column :auth_groups, :auth_group, :boolean, null: false, default: false 
  end
end
