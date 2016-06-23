class CreateUsersAndAuthGroups < ActiveRecord::Migration
  def change
    create_table :auth_groups_users, id: false do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :auth_group, index: true, foreign_key: true
    end
  end
end
