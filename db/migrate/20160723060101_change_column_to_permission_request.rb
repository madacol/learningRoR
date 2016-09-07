class ChangeColumnToPermissionRequest < ActiveRecord::Migration
  def change
  	change_column :permission_requests, :is_pending, :boolean, null: false, default: false
  end
end
