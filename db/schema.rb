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

ActiveRecord::Schema.define(version: 20140302203410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.text     "name"
    t.text     "blurb"
    t.text     "url"
    t.text     "things_needed", default: [], array: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "adventures", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "story_id"
    t.date     "date_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adventures", ["activity_id"], name: "index_adventures_on_activity_id", using: :btree
  add_index "adventures", ["story_id"], name: "index_adventures_on_story_id", using: :btree
  add_index "adventures", ["user_id"], name: "index_adventures_on_user_id", using: :btree

  create_table "stories", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "adventure_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["activity_id"], name: "index_stories_on_activity_id", using: :btree
  add_index "stories", ["adventure_id"], name: "index_stories_on_adventure_id", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end