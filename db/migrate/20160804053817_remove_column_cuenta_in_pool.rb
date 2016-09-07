class RemoveColumnCuentaInPool < ActiveRecord::Migration
  def change
  	remove_column :pools, :cuenta
  	add_column :employees, :loan_balance, :decimal, :precision => 15, :scale => 2
  end
end
