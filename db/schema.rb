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

ActiveRecord::Schema.define(version: 20140424205934) do

  create_table "orders", force: true do |t|
    t.integer  "robot_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["robot_id"], name: "index_orders_on_robot_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "robots", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photoPath"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "robots", ["user_id"], name: "index_robots_on_user_id"

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "userType"
    t.text     "about"
    t.string   "photoPath"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
