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

ActiveRecord::Schema.define(version: 20160808194733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "flights", force: :cascade do |t|
    t.string   "number"
    t.string   "from"
    t.string   "destination"
    t.datetime "departure"
    t.datetime "arrival"
    t.integer  "econom_price"
    t.integer  "business_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "company_id"
    t.integer  "plane_id"
  end

  add_index "flights", ["company_id"], name: "index_flights_on_company_id", using: :btree
  add_index "flights", ["plane_id"], name: "index_flights_on_plane_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "econom_seats"
    t.integer  "business_seats"
    t.integer  "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "flight_id"
    t.integer  "user_id"
  end

  add_index "orders", ["flight_id"], name: "index_orders_on_flight_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "planes", force: :cascade do |t|
    t.string   "number"
    t.integer  "econom_seats"
    t.integer  "business_seats"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "company_id"
  end

  add_index "planes", ["company_id"], name: "index_planes_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "companies", "users"
  add_foreign_key "flights", "companies"
  add_foreign_key "flights", "planes"
  add_foreign_key "orders", "flights"
  add_foreign_key "orders", "users"
  add_foreign_key "planes", "companies"
end
