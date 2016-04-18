class CreateEmployeeGroups < ActiveRecord::Migration
  def change
    create_table :employee_groups do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :auth_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
