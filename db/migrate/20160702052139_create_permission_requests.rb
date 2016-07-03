class CreatePermissionRequests < ActiveRecord::Migration
  def change
    create_table :permission_requests do |t|
      t.references :auth_record, polymorphic: true, index: true
      t.string :token, null: false
      t.boolean :is_pending?, null: false, default: true

      t.datetime :approved_at
      t.timestamps null: false
    end
  end
end