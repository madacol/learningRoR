class IncrementPrecisionToDecimalsColumns < ActiveRecord::Migration
  def change
  	change_column :retenciones, :monto, :decimal, :precision => 15, :scale => 2
  	change_column :odts, :monto_contrato, :decimal, :precision => 15, :scale => 2
  	change_column :pools, :monto, :decimal, :precision => 15, :scale => 2
  	change_column :pools, :balance, :decimal, :precision => 15, :scale => 2
  end
end
