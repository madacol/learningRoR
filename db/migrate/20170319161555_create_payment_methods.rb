class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.references :account, index: true, foreign_key: true
      t.string :method
      t.integer :status

      t.timestamps null: false
    end
  end
end
