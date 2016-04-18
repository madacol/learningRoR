class CreateAuthGroups < ActiveRecord::Migration
  def change
    create_table :auth_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
