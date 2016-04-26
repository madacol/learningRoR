class RemoveRelationsToPool < ActiveRecord::Migration
  def change
  	remove_reference :pools, :gg, index: true, foreign_key: true
  	remove_reference :pools, :inversion, index: true, foreign_key: true
  	remove_reference :pools, :retencione, index: true, foreign_key: true
  	remove_reference :pools, :employee, index: true, foreign_key: true
  	remove_reference :pools, :odt, index: true, foreign_key: true
  end
end