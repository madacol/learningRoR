class AddAliasToGg < ActiveRecord::Migration
  def change
    add_column :ggs, :alias, :string
  end
end
