class AddDateToCajaChicaAndCounts < ActiveRecord::Migration
  def change
    add_column :pools, :date_of, :date
    add_column :banescos, :date_of, :date
    add_column :bdvs, :date_of, :date
    add_column :bods, :date_of, :date
    add_column :mercantils, :date_of, :date
    add_column :provincials, :date_of, :date
  end
end
