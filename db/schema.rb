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

ActiveRecord::Schema.define(version: 2018_11_19_155034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "celestials", force: :cascade do |t|
    t.float "price", null: false
    t.bigint "user_id"
    t.string "category", null: false
    t.string "location", null: false
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["user_id"], name: "index_celestials_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "celestial_id"
    t.bigint "user_id"
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celestial_id"], name: "index_interests_on_celestial_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "interest_id"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_messages_on_interest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "avatar"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "celestials", "users"
  add_foreign_key "interests", "celestials"
  add_foreign_key "interests", "users"
  add_foreign_key "messages", "interests"
end
