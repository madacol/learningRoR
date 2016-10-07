class AddPercentRetencioneIvaToRazonSocial < ActiveRecord::Migration
  def change  	
    add_column :razon_socials, :percent_retencione_iva, :decimal, precision: 6, scale: 6, null: false
  end
end
