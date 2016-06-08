# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160608015756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "specie"
    t.string   "sex"
    t.string   "race"
    t.string   "height"
    t.boolean  "sterilization"
    t.boolean  "adpted"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "imagen"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.integer  "new_owner"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "solicituds", force: :cascade do |t|
    t.string   "nombre"
    t.string   "ocupacion"
    t.integer  "edad"
    t.text     "por_que"
    t.string   "consideras"
    t.boolean  "experiencia"
    t.text     "actividades"
    t.boolean  "gastos"
    t.string   "vivienda"
    t.string   "dormir"
    t.text     "mudarse"
    t.boolean  "ajuste"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "id_pet"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "given_name"
    t.string   "first_surname"
    t.string   "second_surname"
    t.string   "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pets", "users"
end
