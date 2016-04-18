class AddDecimalsToDecimals < ActiveRecord::Migration
  def change
  	change_column :comision_odts, :p_comision, :decimal, :precision => 6, :scale => 6
  	change_column :deducciones_odts, :p_gasto, :decimal, :precision => 6, :scale => 6
  	change_column :retenciones, :monto, :decimal, :precision => 10, :scale => 2
  	change_column :odts, :monto_contrato, :decimal, :precision => 10, :scale => 2
  end
end
