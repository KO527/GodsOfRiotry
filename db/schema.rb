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

ActiveRecord::Schema.define(version: 20170112042639) do

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_tickets", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "venue"
    t.datetime "happening"
    t.string   "name"
    t.integer  "favorite_tally"
  end

  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_away_team_and_away_team_and_happening", unique: true
  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_happening", unique: true
  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_home_team_and_away_team_and_happening", unique: true
  add_index "event_tickets", ["name", "happening"], name: "index_event_tickets_on_artist_name_and_name_and_happening", unique: true
  add_index "event_tickets", ["name", "happening"], name: "index_event_tickets_on_performer_name_and_name_and_happening", unique: true

  create_table "gor_clothings", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.float    "sizes"
    t.integer  "quantity"
  end

  create_table "performers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "performers", [nil], name: "index_performers_on_name"

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "time_favorited"
  end

  add_index "preferences", ["time_favorited"], name: "index_preferences_on_time_favorited", unique: true

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", [nil, nil, nil], name: "index_songs_on_song_name_and_artist_name_and_favorite_tally"
  add_index "songs", [nil, nil], name: "index_songs_on_song_name_and_artist_name", unique: true

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "remember_digest"
    t.string   "password_digest"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "provider_name"
    t.string   "provider_location"
    t.integer  "provider_followers_count"
    t.integer  "provider_playlist_count"
    t.string   "provider_full_name"
    t.string   "provider_nickname"
    t.string   "access_token"
  end

end
