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

ActiveRecord::Schema[7.0].define(version: 2022_03_23_111500) do
  create_table "Weekly_disbursements", force: :cascade do |t|
    t.float "amount"
    t.float "sequra_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "orders_id"
    t.index ["orders_id"], name: "index_Weekly_disbursements_on_orders_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id", null: false
    t.integer "weekly_disbursement_id", null: false
    t.index ["order_id"], name: "index_merchants_on_order_id"
    t.index ["weekly_disbursement_id"], name: "index_merchants_on_weekly_disbursement_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "amount"
    t.datetime "completed_at"
    t.integer "shoper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "nif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id", null: false
    t.index ["order_id"], name: "index_shopers_on_order_id"
  end

  add_foreign_key "Weekly_disbursements", "orders", column: "orders_id"
  add_foreign_key "merchants", "orders"
  add_foreign_key "merchants", "weekly_disbursements"
  add_foreign_key "shopers", "orders"
end
