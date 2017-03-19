class DestroyCuentaInPool < ActiveRecord::Migration
  def change
		remove_column :pools, :cuenta, :integer
  end
end
