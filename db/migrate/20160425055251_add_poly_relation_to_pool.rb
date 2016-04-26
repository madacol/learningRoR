class AddPolyRelationToPool < ActiveRecord::Migration
  def change
	add_reference :pools, :category, polymorphic: true, index: true
  end
end
