class AddAliasToTables < ActiveRecord::Migration
  def change
    add_column :ggs, :alias, :string
    add_column :inversions, :alias, :string
  end
end
