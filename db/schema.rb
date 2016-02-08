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

ActiveRecord::Schema.define(version: 20160208074439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balance_records", force: :cascade do |t|
    t.integer  "pool_id"
    t.integer  "member_id"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "balance_records", ["member_id"], name: "index_balance_records_on_member_id", using: :btree
  add_index "balance_records", ["pool_id"], name: "index_balance_records_on_pool_id", using: :btree

  create_table "deposits", force: :cascade do |t|
    t.integer  "pool_id"
    t.integer  "member_id"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deposits", ["member_id"], name: "index_deposits_on_member_id", using: :btree
  add_index "deposits", ["pool_id"], name: "index_deposits_on_pool_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "pool_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["pool_id"], name: "index_members_on_pool_id", using: :btree

  create_table "pools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "withdrawals", force: :cascade do |t|
    t.integer  "pool_id"
    t.integer  "member_id"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "withdrawals", ["member_id"], name: "index_withdrawals_on_member_id", using: :btree
  add_index "withdrawals", ["pool_id"], name: "index_withdrawals_on_pool_id", using: :btree

end
