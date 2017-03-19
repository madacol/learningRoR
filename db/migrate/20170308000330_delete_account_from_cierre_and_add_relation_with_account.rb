class DeleteAccountFromCierreAndAddRelationWithAccount < ActiveRecord::Migration
  def change
		remove_column :cierres, :account, :integer
  	add_reference :cierres, :account, index: true, foreign_key: true
  end
end
