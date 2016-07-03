class AddTimestampToAction < ActiveRecord::Migration
  def change
    change_table :actions do |t|
      t.timestamps null: false
    end
  end
end
