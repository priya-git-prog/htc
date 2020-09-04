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

ActiveRecord::Schema.define(version: 20200904093720) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.date "dob"
    t.date "doj"
    t.string "passenger_name"
    t.string "from"
    t.string "to"
    t.string "travel_class"
    t.float "ticket_amount"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "agent_charge"
    t.float "cgst"
    t.float "sgst"
    t.index ["company_id"], name: "index_tickets_on_company_id"
  end

end
