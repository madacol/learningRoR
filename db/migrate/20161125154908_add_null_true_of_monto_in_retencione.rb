class AddNullTrueOfMontoInRetencione < ActiveRecord::Migration
  def change  	
  	change_column :retenciones, :monto, :decimal, :precision => 15, :scale => 2, :null => true
  end
end
