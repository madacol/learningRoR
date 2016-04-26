class AddAliasToOdt < ActiveRecord::Migration
  def change
    add_column :odts, :alias, :string
  end
end
