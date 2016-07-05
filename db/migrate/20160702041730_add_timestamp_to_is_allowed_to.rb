class AddTimestampToIsAllowedTo < ActiveRecord::Migration
  def change
    change_table :is_allowed_tos do |t|
      t.timestamps null: false
    end
  end
end
