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

ActiveRecord::Schema.define(version: 20170422152605) do

  create_table "expenses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "amount"
    t.integer  "start_month"
    t.integer  "interval"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "months", force: :cascade do |t|
    t.date     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "amount"
    t.boolean  "paid"
    t.integer  "expense_id"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_payments_on_expense_id"
    t.index ["month_id"], name: "index_payments_on_month_id"
  end

end
