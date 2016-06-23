class DropTableEmployeeGroup < ActiveRecord::Migration
  def change
  	drop_table :employee_groups
  end
end
