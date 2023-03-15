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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_125954) do
  create_table "invoices", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "guest_id"
    t.decimal "total", precision: 15, scale: 2
    t.datetime "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_invoices_on_guest_id"
    t.index ["owner_id"], name: "index_invoices_on_owner_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 15, scale: 2
    t.datetime "check_in_time"
    t.integer "owner_id", null: false
    t.integer "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_rooms_on_guest_id"
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
  end

  create_table "stays", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "guest_id"
    t.datetime "check_in_time", null: false
    t.datetime "check_out_time", null: false
    t.decimal "total", precision: 15, scale: 2, null: false
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_stays_on_guest_id"
    t.index ["invoice_id"], name: "index_stays_on_invoice_id"
    t.index ["room_id"], name: "index_stays_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invoices", "users", column: "guest_id"
  add_foreign_key "invoices", "users", column: "owner_id"
  add_foreign_key "rooms", "users", column: "guest_id"
  add_foreign_key "rooms", "users", column: "owner_id"
  add_foreign_key "stays", "invoices"
  add_foreign_key "stays", "rooms"
  add_foreign_key "stays", "users", column: "guest_id"
end
