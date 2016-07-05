# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160702052139) do

  create_table "actions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "auth_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "auth_groups_users", id: false, force: :cascade do |t|
    t.integer "user_id",       limit: 4
    t.integer "auth_group_id", limit: 4
  end

  add_index "auth_groups_users", ["auth_group_id"], name: "index_auth_groups_users_on_auth_group_id", using: :btree
  add_index "auth_groups_users", ["user_id"], name: "index_auth_groups_users_on_user_id", using: :btree

  create_table "comision_odts", force: :cascade do |t|
    t.integer  "odt_id",      limit: 4,                         null: false
    t.integer  "employee_id", limit: 4,                         null: false
    t.decimal  "p_comision",            precision: 6, scale: 6, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "comision_odts", ["employee_id"], name: "index_comision_odts_on_employee_id", using: :btree
  add_index "comision_odts", ["odt_id"], name: "index_comision_odts_on_odt_id", using: :btree

  create_table "deducciones_odts", force: :cascade do |t|
    t.integer  "odt_id",     limit: 4,                           null: false
    t.string   "name",       limit: 255,                         null: false
    t.decimal  "p_gasto",                precision: 6, scale: 6, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "deducciones_odts", ["odt_id"], name: "index_deducciones_odts_on_odt_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "cedula",       limit: 255
    t.string   "name",         limit: 255
    t.string   "last_name",    limit: 255
    t.string   "phone_number", limit: 255
    t.string   "email",        limit: 255
    t.text     "address",      limit: 65535
    t.date     "startdate"
    t.text     "note",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ggs", force: :cascade do |t|
    t.string   "code",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "alias",       limit: 255
  end

  add_index "ggs", ["code"], name: "index_ggs_on_code", unique: true, using: :btree

  create_table "inversions", force: :cascade do |t|
    t.string   "code",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "alias",       limit: 255
  end

  add_index "inversions", ["code"], name: "index_inversions_on_code", unique: true, using: :btree

  create_table "is_allowed_tos", force: :cascade do |t|
    t.integer  "auth_group_id", limit: 4,                 null: false
    t.integer  "action_id",     limit: 4,                 null: false
    t.boolean  "create?",                 default: false, null: false
    t.boolean  "read?",                   default: false, null: false
    t.boolean  "update?",                 default: false, null: false
    t.boolean  "destroy?",                default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "is_allowed_tos", ["action_id"], name: "index_is_allowed_tos_on_action_id", using: :btree
  add_index "is_allowed_tos", ["auth_group_id"], name: "index_is_allowed_tos_on_auth_group_id", using: :btree

  create_table "odts", force: :cascade do |t|
    t.string   "code",            limit: 255,                            null: false
    t.text     "description",     limit: 65535,                          null: false
    t.integer  "razon_social_id", limit: 4,                              null: false
    t.decimal  "monto_contrato",                precision: 15, scale: 2, null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "alias",           limit: 255
  end

  add_index "odts", ["code"], name: "index_odts_on_code", unique: true, using: :btree
  add_index "odts", ["razon_social_id"], name: "index_odts_on_razon_social_id", using: :btree

  create_table "permission_requests", force: :cascade do |t|
    t.integer  "auth_record_id",   limit: 4
    t.string   "auth_record_type", limit: 255
    t.string   "token",            limit: 255,                null: false
    t.boolean  "is_pending",                   default: true, null: false
    t.datetime "approved_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "permission_requests", ["auth_record_type", "auth_record_id"], name: "index_permission_requests_on_auth_record_type_and_auth_record_id", using: :btree

  create_table "pools", force: :cascade do |t|
    t.integer  "cuenta",           limit: 4
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

  add_index "pools", ["category_type", "category_id"], name: "index_pools_on_category_type_and_category_id", using: :btree
  add_index "pools", ["razon_social_id"], name: "index_pools_on_razon_social_id", using: :btree

  create_table "razon_socials", force: :cascade do |t|
    t.string   "rif_ci",        limit: 255,   null: false
    t.string   "name",          limit: 255,   null: false
    t.text     "description",   limit: 65535
    t.string   "phone",         limit: 255
    t.string   "email",         limit: 255
    t.text     "address",       limit: 65535
    t.string   "contact_name",  limit: 255
    t.string   "contact_phone", limit: 255
    t.string   "contact_email", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "razon_socials", ["email"], name: "index_razon_socials_on_email", unique: true, using: :btree
  add_index "razon_socials", ["rif_ci"], name: "index_razon_socials_on_rif_ci", unique: true, using: :btree

  create_table "retenciones", force: :cascade do |t|
    t.string   "code_factura",    limit: 255,                            null: false
    t.integer  "razon_social_id", limit: 4,                              null: false
    t.integer  "tipo",            limit: 4,                              null: false
    t.decimal  "monto",                         precision: 15, scale: 2, null: false
    t.text     "description",     limit: 65535
    t.integer  "status",          limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "retenciones", ["code_factura"], name: "index_retenciones_on_code_factura", unique: true, using: :btree
  add_index "retenciones", ["razon_social_id"], name: "index_retenciones_on_razon_social_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "employee_id",            limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["employee_id"], name: "index_users_on_employee_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "auth_groups_users", "auth_groups"
  add_foreign_key "auth_groups_users", "users"
  add_foreign_key "comision_odts", "employees"
  add_foreign_key "comision_odts", "odts"
  add_foreign_key "deducciones_odts", "odts"
  add_foreign_key "is_allowed_tos", "actions"
  add_foreign_key "is_allowed_tos", "auth_groups"
  add_foreign_key "odts", "razon_socials"
  add_foreign_key "pools", "razon_socials"
  add_foreign_key "retenciones", "razon_socials"
end
