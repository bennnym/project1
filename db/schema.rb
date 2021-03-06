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

ActiveRecord::Schema.define(version: 2019_04_22_230258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.text "source"
    t.text "title"
    t.text "description"
    t.text "url"
    t.text "image"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
  end

  create_table "players", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "games_played"
    t.float "ppg"
    t.float "trb"
    t.float "apg"
    t.float "fgperc"
    t.float "threepperc"
    t.float "ftperc"
    t.float "efgperc"
    t.float "per"
    t.float "ws"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "player_id", null: false
    t.index ["player_id", "user_id"], name: "index_players_users_on_player_id_and_user_id"
    t.index ["user_id", "player_id"], name: "index_players_users_on_user_id_and_player_id"
  end

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
    t.integer "team_id"
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
