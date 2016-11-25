class RemoveColumnFromRetencione < ActiveRecord::Migration
  def change
    remove_reference :retenciones, :razon_social, index: true, foreign_key: true
  end
end
