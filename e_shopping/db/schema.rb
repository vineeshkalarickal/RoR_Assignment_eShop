# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_05_180628) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "address"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cart_id"
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.decimal "item_price"
    t.decimal "item_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "address_id"
    t.integer "cart_id"
    t.integer "line_items_id"
    t.decimal "final_price"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "image_url"
    t.integer "quantity"
    t.string "category_id"
    t.string "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
    t.string "discount"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
