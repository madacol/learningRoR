class RenameCodeFacturaToCodeInRetencione < ActiveRecord::Migration
  def change
  	rename_column :retenciones, :code_factura, :code
  end
end
