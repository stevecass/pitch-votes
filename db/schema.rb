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

ActiveRecord::Schema.define(version: 20140923153251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: true do |t|
    t.string   "cohort_name"
    t.string   "location"
    t.date     "pitch_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pitches", force: true do |t|
    t.integer  "day_id"
    t.string   "proposer"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "gravatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voting_round_candidates", force: true do |t|
    t.integer  "voting_round_id"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voting_round_votes", force: true do |t|
    t.integer  "voting_round_candidate_id"
    t.string   "voter"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voting_rounds", force: true do |t|
    t.integer  "day_id"
    t.integer  "round_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_open",      default: true, null: false
  end

end
