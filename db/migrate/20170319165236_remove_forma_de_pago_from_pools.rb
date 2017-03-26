class RemoveFormaDePagoFromPools < ActiveRecord::Migration
  def change
    remove_column :pools, :forma_de_pago, :integer
    add_reference :pools, :payment_method, index: true, foreign_key: true
  end
end