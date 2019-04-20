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

ActiveRecord::Schema.define(version: 2019_04_20_031457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scores", force: :cascade do |t|
    t.text "home_team"
    t.integer "home_score"
    t.text "away_team"
    t.integer "away_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "conference"
    t.string "division"
    t.string "founded"
    t.string "arena"
    t.string "location"
    t.string "colors"
    t.string "general_manager"
    t.string "president"
    t.string "headcoach"
    t.string "championships"
    t.text "team_url"
    t.text "logo"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "tweet"
    t.integer "favorite"
    t.string "language"
    t.integer "retweet_count"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "embed"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
  end

end
