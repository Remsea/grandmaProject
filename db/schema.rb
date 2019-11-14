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

ActiveRecord::Schema.define(version: 2019_11_14_144520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competences", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "grandmas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.float "price"
    t.text "address"
    t.integer "age"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competence_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["competence_id"], name: "index_grandmas_on_competence_id"
    t.index ["user_id"], name: "index_grandmas_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "grandma_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "rentaldate"
    t.index ["grandma_id"], name: "index_transactions_on_grandma_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "grandmas", "competences"
  add_foreign_key "grandmas", "users"
  add_foreign_key "transactions", "grandmas"
  add_foreign_key "transactions", "users"
end
