class AddRecibidoPorToPool < ActiveRecord::Migration
  def change
  	add_column :pools, :receiver, :string
  	add_column :bdvs, :receiver, :string
  	add_column :bods, :receiver, :string
  	add_column :provincials, :receiver, :string
  	add_column :mercantils, :receiver, :string
  	add_column :banescos, :receiver, :string
  end
end
