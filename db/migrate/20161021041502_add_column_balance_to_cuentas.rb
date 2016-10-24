class AddColumnBalanceToCuentas < ActiveRecord::Migration
	def change
		add_column :pools, :balance, :decimal, :precision => 15, :scale => 2 
		add_column :bdvs, :balance, :decimal, :precision => 15, :scale => 2 
		add_column :bods, :balance, :decimal, :precision => 15, :scale => 2 
		add_column :provincials, :balance, :decimal, :precision => 15, :scale => 2 
		add_column :mercantils, :balance, :decimal, :precision => 15, :scale => 2 
		add_column :banescos, :balance, :decimal, :precision => 15, :scale => 2 
  end
end
