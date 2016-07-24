class CreateBdvs < ActiveRecord::Migration
  def change
    create_table "bdvs", force: :cascade do |t|
      t.integer  "comprobante_type", limit: 4
      t.string   "n_comprobante",    limit: 255
      t.decimal  "monto",                          precision: 15, scale: 2
      t.decimal  "balance",                        precision: 15, scale: 2
      t.text     "description",      limit: 65535
      t.datetime "created_at",                                              null: false
      t.datetime "updated_at",                                              null: false
      t.integer  "razon_social_id",  limit: 4
      t.integer  "category_id",      limit: 4
      t.string   "category_type",    limit: 255
    end

    add_index "bdvs", ["category_type", "category_id"], name: "index_bdvs_on_category_type_and_category_id", using: :btree
    add_index "bdvs", ["razon_social_id"], name: "index_bdvs_on_razon_social_id", using: :btree
  end
end