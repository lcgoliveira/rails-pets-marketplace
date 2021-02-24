# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_23_195920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoptions", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "concluded", default: false
    t.date "concluded_at"
    t.index ["pet_id"], name: "index_adoptions_on_pet_id"
    t.index ["user_id"], name: "index_adoptions_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "animal_type", null: false
    t.string "name"
    t.integer "age"
    t.text "description", null: false
    t.boolean "being_donated", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "date_of_birth"
    t.string "doc_cpf", default: "", null: false
    t.string "description"
    t.decimal "long", precision: 10, scale: 6
    t.decimal "lat", precision: 10, scale: 6
    t.string "address", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adoptions", "pets"
  add_foreign_key "adoptions", "users"
  add_foreign_key "pets", "users"
end
