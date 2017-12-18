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

ActiveRecord::Schema.define(version: 20171218023755) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "earring"
    t.string   "name"
    t.integer  "lot_id"
    t.date     "birth"
    t.integer  "breed"
    t.integer  "blood"
    t.integer  "sex"
    t.integer  "source"
    t.integer  "price"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lot_id"], name: "index_animals_on_lot_id"
    t.index ["property_id"], name: "index_animals_on_property_id"
  end

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.integer  "motive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discards", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "cause_id"
    t.date     "date"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_discards_on_animal_id"
    t.index ["cause_id"], name: "index_discards_on_cause_id"
  end

  create_table "lots", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "phase"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medicaments", force: :cascade do |t|
    t.string   "description"
    t.integer  "carencyday"
    t.integer  "measure"
    t.text     "usemode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medications", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "medicament_id"
    t.date     "applied"
    t.integer  "disease"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["animal_id"], name: "index_medications_on_animal_id"
    t.index ["medicament_id"], name: "index_medications_on_medicament_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "proprietary"
    t.integer  "size"
    t.string   "phone"
    t.string   "state"
    t.string   "city"
    t.string   "comunity"
    t.string   "complement"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "weighings", force: :cascade do |t|
    t.integer  "animal_id"
    t.float    "weight"
    t.float    "height"
    t.date     "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_weighings_on_animal_id"
  end

end
