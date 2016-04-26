class AddColumnToPool < ActiveRecord::Migration
  def change
    add_reference :pools, :razon_social, index: true, foreign_key: true
  end
end
