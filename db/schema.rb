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

ActiveRecord::Schema.define(version: 2019_08_22_090645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developments", force: :cascade do |t|
    t.string "application_number"
    t.string "site_address"
    t.text "proposal"
    t.string "ward"
    t.string "parish"
    t.date "signed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "dwellings", force: :cascade do |t|
    t.bigint "development_id"
    t.string "tenure"
    t.integer "habitable_rooms"
    t.integer "bedrooms"
    t.string "rsl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "uprn"
    t.string "registered_provider"
    t.index ["development_id"], name: "index_dwellings_on_development_id"
  end

  add_foreign_key "dwellings", "developments"
end
