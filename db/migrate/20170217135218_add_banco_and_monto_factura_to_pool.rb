class AddBancoAndMontoFacturaToPool < ActiveRecord::Migration
	def change
		add_column :pools, :cuenta, :integer
		add_column :pools, :monto_factura, :decimal, :precision => 15, :scale => 2
  end
end
