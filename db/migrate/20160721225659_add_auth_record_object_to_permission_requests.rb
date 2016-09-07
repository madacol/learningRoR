class AddAuthRecordObjectToPermissionRequests < ActiveRecord::Migration
  def change  	
    add_column :permission_requests, :auth_record_object, :text
    add_column :permission_requests, :action, :string
  end
end
