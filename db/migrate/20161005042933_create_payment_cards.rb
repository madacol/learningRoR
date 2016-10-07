class CreatePaymentCards < ActiveRecord::Migration
  def change
    create_table :payment_cards do |t|
      t.integer :bank
      t.integer :card_type
      t.integer :last_digits
      t.integer :status

      t.timestamps null: false
    end
  end
end
