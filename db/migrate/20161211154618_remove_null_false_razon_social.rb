class RemoveNullFalseRazonSocial < ActiveRecord::Migration
  def change
    change_column :razon_socials, :rif_ci, :string, :null => true
    change_column :razon_socials, :percent_retencione_iva, :decimal, precision: 6, scale: 6, :null => true
  end
end
