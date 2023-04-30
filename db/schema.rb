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

ActiveRecord::Schema[7.0].define(version: 2023_04_29_150615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_sales", force: :cascade do |t|
    t.string "purchaser_name"
    t.string "item_description"
    t.decimal "item_price"
    t.integer "purchase_count"
    t.string "merchant_address"
    t.string "merchant_name"
    t.bigint "file_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_id"], name: "index_company_sales_on_file_id"
  end

  create_table "sale_files", force: :cascade do |t|
    t.string "files", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "company_sales", "sale_files", column: "file_id"
end
