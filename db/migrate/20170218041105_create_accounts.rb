class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :n_cuenta
      t.text :description

      t.timestamps null: false
    end
  end
end
