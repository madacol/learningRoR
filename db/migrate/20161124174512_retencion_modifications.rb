class RetencionModifications < ActiveRecord::Migration
  def change
    remove_column :retenciones, :status, :integer
    remove_column :retenciones, :tipo, :integer, :null => false
    rename_column :retenciones, :code_factura, :name
  end
end