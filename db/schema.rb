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

ActiveRecord::Schema.define(version: 20160328045203) do

  create_table "confirms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "informs", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "resturant_name", limit: 255
    t.string   "place",          limit: 255
    t.string   "mobile",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "email",          limit: 255
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.integer  "order_id",    limit: 4
    t.decimal  "unit_price",            precision: 12, scale: 3
    t.integer  "quantity",    limit: 4
    t.decimal  "total_price",           precision: 12, scale: 3
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                  precision: 12, scale: 3
    t.decimal  "tax",                       precision: 12, scale: 3
    t.decimal  "shipping",                  precision: 12, scale: 3
    t.decimal  "total",                     precision: 12, scale: 3
    t.integer  "order_status_id", limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.decimal  "price",                          precision: 12, scale: 3
    t.boolean  "active",             limit: 1
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "resturant_id",       limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "products", ["resturant_id"], name: "index_products_on_resturant_id", using: :btree

  create_table "resturants", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "owner_name",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "owner_id",           limit: 4
  end

  add_index "resturants", ["owner_id"], name: "index_resturants_on_owner_id", using: :btree
  add_index "resturants", ["user_id"], name: "index_resturants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
    t.string   "role",            limit: 255, default: "user"
    t.boolean  "admin",           limit: 1,   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "products", "resturants"
  add_foreign_key "resturants", "owners"
  add_foreign_key "resturants", "users"
end
