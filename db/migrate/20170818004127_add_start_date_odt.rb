class AddStartDateOdt < ActiveRecord::Migration
  def change
    add_column :odts, :start_date, :date
  end
end
