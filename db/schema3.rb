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

ActiveRecord::Schema.define(version: 2022_11_14_231650) do

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_person_name"
    t.string "email"
    t.string "mobile_number"
    t.string "phone_number"
    t.string "postal_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "inv_number"
    t.datetime "date_of_issue"
    t.datetime "due_date"
    t.string "job_reference"
    t.string "description"
    t.integer "quantity"
    t.integer "unit_price"
    t.integer "sum_amount"
    t.integer "tax"
    t.integer "total_amount"
    t.integer "paid_amount"
    t.integer "due_amount"
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_id"
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "profiles", id: :string, force: :cascade do |t|
    t.string "profile_name"
    t.string "company_name"
    t.string "address"
    t.string "abn"
    t.string "email"
    t.string "contact_number"
    t.string "bank_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "invoices", "clients"
end
