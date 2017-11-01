class AddEndDateToOdt < ActiveRecord::Migration
  def change
    add_column :odts, :end_date, :date
  end
end