class ChangeTypenameToRetencione < ActiveRecord::Migration
  def change
  	rename_column :retenciones, :type, :tipo
  end
end
