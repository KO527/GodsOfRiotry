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

ActiveRecord::Schema.define(version: 20170127184522) do

  create_table "acts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acts_event_ticket", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "act_id",          null: false
  end

  add_index "acts_event_ticket", ["act_id", "event_ticket_id"], name: "index_acts_event_ticket_on_act_id_and_event_ticket_id"
  add_index "acts_event_ticket", ["event_ticket_id", "act_id"], name: "index_acts_event_ticket_on_event_ticket_id_and_act_id"

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
  end

  create_table "artists_event_ticket", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "artist_id",       null: false
  end

  add_index "artists_event_ticket", ["artist_id", "event_ticket_id"], name: "index_artists_event_ticket_on_artist_id_and_event_ticket_id"
  add_index "artists_event_ticket", ["event_ticket_id", "artist_id"], name: "index_artists_event_ticket_on_event_ticket_id_and_artist_id"

  create_table "event_ticket_teams", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "team_id",         null: false
  end

  add_index "event_ticket_teams", ["event_ticket_id", "team_id"], name: "index_event_ticket_teams_on_event_ticket_id_and_team_id"
  add_index "event_ticket_teams", ["team_id", "event_ticket_id"], name: "index_event_ticket_teams_on_team_id_and_event_ticket_id"

  create_table "event_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "venue"
    t.datetime "happening"
    t.string   "name"
    t.integer  "fav_count"
    t.integer  "user_id"
  end

  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_away_team_and_away_team_and_happening", unique: true
  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_happening", unique: true
  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_home_team_and_away_team_and_happening", unique: true
  add_index "event_tickets", ["name", "happening"], name: "index_event_tickets_on_artist_name_and_name_and_happening", unique: true
  add_index "event_tickets", ["name", "happening"], name: "index_event_tickets_on_performer_name_and_name_and_happening", unique: true
  add_index "event_tickets", ["user_id"], name: "index_event_tickets_on_user_id"

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

  create_table "playlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_Playlists_on_user_id"

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
    t.integer  "user_id"
  end

  add_index "preferences", ["user_id"], name: "index_Preferences_on_user_id"

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "fav_count"
    t.integer  "playlist_id"
    t.integer  "preference_id"
    t.integer  "artist_id"
  end

  add_index "songs", ["artist_id"], name: "index_Songs_on_artist_id"
  add_index "songs", ["playlist_id"], name: "index_Songs_on_playlist_id"
  add_index "songs", ["preference_id"], name: "index_Songs_on_preference_id"

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
