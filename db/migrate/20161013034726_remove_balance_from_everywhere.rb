class RemoveBalanceFromEverywhere < ActiveRecord::Migration
	def change
		remove_column :pools, :balance
		remove_column :bdvs, :balance
		remove_column :bods, :balance
		remove_column :provincials, :balance
		remove_column :mercantils, :balance
		remove_column :banescos, :balance
	end
end
