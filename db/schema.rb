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

ActiveRecord::Schema.define(version: 20180908085649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "staffs", force: :cascade do |t|
    t.string "staff_id"
    t.string "staff_name"
    t.string "postal_code"
    t.string "street_address_1"
    t.string "street_address_2"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "enrolled"
    t.date "scheduled_return_date"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "product_type"
    t.string "manufacturer"
    t.string "serial_number"
    t.string "asset_management_number"
    t.string "situation", default: "在庫"
    t.string "lending_date"
    t.string "return_date"
    t.string "staff_id", default: "0"
    t.string "remarks"
    t.string "last_lent_person"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login_id"
    t.string "password_digest"
    t.text "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

end
