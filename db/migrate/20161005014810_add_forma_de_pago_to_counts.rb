class AddFormaDePagoToCounts < ActiveRecord::Migration
  def change
  	add_column :pools, :forma_de_pago, :integer
  	add_column :bdvs, :forma_de_pago, :integer
  	add_column :bods, :forma_de_pago, :integer
  	add_column :provincials, :forma_de_pago, :integer
  	add_column :mercantils, :forma_de_pago, :integer
  	add_column :banescos, :forma_de_pago, :integer
  	add_column :pools, :forma_de_pago_nro, :string, limit: 255
  	add_column :bdvs, :forma_de_pago_nro, :string, limit: 255
  	add_column :bods, :forma_de_pago_nro, :string, limit: 255
  	add_column :provincials, :forma_de_pago_nro, :string, limit: 255
  	add_column :mercantils, :forma_de_pago_nro, :string, limit: 255
  	add_column :banescos, :forma_de_pago_nro, :string, limit: 255
  end
end
