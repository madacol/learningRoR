class RenameCedulaToCodeInEmployee < ActiveRecord::Migration
  def change
  	rename_column :employees, :cedula, :code
  end
end
