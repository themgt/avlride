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

ActiveRecord::Schema.define(version: 20140531203419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "neighborhoods", force: true do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "ride_id",    null: false
    t.string   "overall",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ride_offers", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "ride_id",    null: false
    t.text     "message",    null: false
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.integer  "user_id",         null: false
    t.float    "lat_a"
    t.float    "lon_a"
    t.float    "lat_b"
    t.float    "lon_b"
    t.boolean  "has_car"
    t.text     "message"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "neighborhood_id", null: false
    t.string   "title"
    t.string   "timespan"
    t.date     "leave_on"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat_home"
    t.float    "lon_home"
    t.float    "lat_work"
    t.float    "lon_work"
    t.boolean  "have_car"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "home_neighborhood_id"
    t.integer  "work_neighborhood_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
