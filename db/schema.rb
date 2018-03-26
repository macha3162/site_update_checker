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

ActiveRecord::Schema.define(version: 20180320084231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "site_diffs", force: :cascade do |t|
    t.integer "site_id"
    t.string "checksum"
    t.integer "status_code"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_site_versions_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "start_with"
    t.string "end_with"
    t.integer "site_versions_count"
    t.string "status"
    t.datetime "last_crawled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
