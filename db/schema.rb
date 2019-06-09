# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 2019_06_03_044652) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.boolean "matter", default: false, null: false
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_pages_on_work_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "stage_id"
    t.bigint "page_id"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_progresses_on_page_id"
    t.index ["stage_id"], name: "index_progresses_on_stage_id"
    t.index ["work_id"], name: "index_progresses_on_work_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_stages_on_work_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "deadline"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "pages", "works"
  add_foreign_key "progresses", "pages"
  add_foreign_key "progresses", "stages"
  add_foreign_key "progresses", "works"
  add_foreign_key "works", "users"
end
