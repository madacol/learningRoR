class RemoveComprobanteTypeOfPools < ActiveRecord::Migration
  def change
  	remove_column :pools, :comprobante_type
  	remove_column :bdvs, :comprobante_type
  	remove_column :bods, :comprobante_type
  	remove_column :provincials, :comprobante_type
  	remove_column :mercantils, :comprobante_type
  	remove_column :banescos, :comprobante_type  	
  end
end
