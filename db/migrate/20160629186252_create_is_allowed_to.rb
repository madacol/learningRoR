class CreateIsAllowedTo < ActiveRecord::Migration
  def change
    create_table :is_allowed_tos do |t|
      t.references :auth_group, index: true, foreign_key: true, :null => false
      t.references :action, index: true, foreign_key: true, :null => false
      t.boolean :create?, null: false, default: false
      t.boolean :read?, null: false, default: false
      t.boolean :update?, null: false, default: false
      t.boolean :destroy?, null: false, default: false
    end
  end
end
