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

ActiveRecord::Schema.define(version: 20200202124307) do

  create_table "floor_residents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "floor_id"
    t.integer  "resident_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["floor_id"], name: "index_floor_residents_on_floor_id", using: :btree
    t.index ["resident_id"], name: "index_floor_residents_on_resident_id", using: :btree
  end

  create_table "floors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["name"], name: "index_floors_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_floors_on_user_id", using: :btree
  end

  create_table "records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "image"
    t.integer  "floor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "resident_id"
    t.string   "writer_name"
    t.integer  "user_id"
    t.index ["floor_id"], name: "index_records_on_floor_id", using: :btree
  end

  create_table "residents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "floor_residents", "floors"
  add_foreign_key "floor_residents", "residents"
  add_foreign_key "floors", "users"
  add_foreign_key "records", "floors"
end
