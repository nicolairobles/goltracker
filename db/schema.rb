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

ActiveRecord::Schema.define(version: 20160301174613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goal_data_pts", force: :cascade do |t|
    t.integer  "data_pt_num"
    t.integer  "perceived_performance"
    t.float    "perceived_progress"
    t.float    "actual_progress"
    t.integer  "goal_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "goal_data_pts", ["goal_id"], name: "index_goal_data_pts_on_goal_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.string   "goal_title"
    t.integer  "time_allotted"
    t.text     "goal_description"
    t.float    "goal_potential_met"
    t.integer  "total_data_pts"
    t.text     "time_recommendation"
    t.text     "speed_recommendation"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "track_time"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name"
    t.float    "skill_potential_met"
    t.integer  "goal_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "skills", ["goal_id"], name: "index_skills_on_goal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "password_digest"
    t.float    "potential_met"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "phone_number"
  end

  add_foreign_key "goal_data_pts", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "skills", "goals"
end
