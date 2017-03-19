class AddReferenceAccountToPool < ActiveRecord::Migration
  def change
  	add_reference :pools, :account, index: true, foreign_key: true
  end
end
