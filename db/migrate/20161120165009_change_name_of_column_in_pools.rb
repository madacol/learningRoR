class ChangeNameOfColumnInPools < ActiveRecord::Migration
  def change
  	rename_column :pools, :n_comprobante, :n_factura
  	rename_column :bdvs, :n_comprobante, :n_factura
  	rename_column :bods, :n_comprobante, :n_factura
  	rename_column :provincials, :n_comprobante, :n_factura
  	rename_column :mercantils, :n_comprobante, :n_factura
  	rename_column :banescos, :n_comprobante, :n_factura
  end
end
