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

ActiveRecord::Schema.define(version: 20170820002437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acts_event_ticket", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "act_id",          null: false
  end

  add_index "acts_event_ticket", ["act_id", "event_ticket_id"], name: "index_acts_event_ticket_on_act_id_and_event_ticket_id", using: :btree
  add_index "acts_event_ticket", ["event_ticket_id", "act_id"], name: "index_acts_event_ticket_on_event_ticket_id_and_act_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
  end

  create_table "artists_event_ticket", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "artist_id",       null: false
  end

  add_index "artists_event_ticket", ["artist_id", "event_ticket_id"], name: "index_artists_event_ticket_on_artist_id_and_event_ticket_id", using: :btree
  add_index "artists_event_ticket", ["event_ticket_id", "artist_id"], name: "index_artists_event_ticket_on_event_ticket_id_and_artist_id", using: :btree

  create_table "event_ticket_teams", id: false, force: :cascade do |t|
    t.integer "event_ticket_id", null: false
    t.integer "team_id",         null: false
  end

  add_index "event_ticket_teams", ["event_ticket_id", "team_id"], name: "index_event_ticket_teams_on_event_ticket_id_and_team_id", using: :btree
  add_index "event_ticket_teams", ["team_id", "event_ticket_id"], name: "index_event_ticket_teams_on_team_id_and_event_ticket_id", using: :btree

  create_table "event_tickets", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "venue"
    t.datetime "happening"
    t.string   "name"
    t.string   "artist_id"
    t.string   "artist_name"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "fav_count"
    t.integer  "user_id"
    t.string   "performer_id"
  end

  add_index "event_tickets", ["artist_name", "name", "happening"], name: "index_event_tickets_on_artist_name_and_name_and_happening", unique: true, using: :btree
  add_index "event_tickets", ["away_team", "away_team", "happening"], name: "index_event_tickets_on_away_team_and_away_team_and_happening", unique: true, using: :btree
  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_happening", unique: true, using: :btree
  add_index "event_tickets", ["home_team", "away_team", "happening"], name: "index_event_tickets_on_home_team_and_away_team_and_happening", unique: true, using: :btree
  add_index "event_tickets", ["user_id"], name: "index_event_tickets_on_user_id", using: :btree

  create_table "gor_clothings", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.float    "price"
    t.text     "description"
    t.float    "sizes"
    t.integer  "quantity"
    t.integer  "gender",           default: 0,     null: false
    t.integer  "purchase_status",                  null: false
    t.integer  "status",           default: 0,     null: false
    t.string   "colors_available"
    t.integer  "wardrobe_id"
    t.boolean  "standalone",       default: false
  end

  add_index "gor_clothings", ["wardrobe_id"], name: "index_gor_clothings_on_wardrobe_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "type_of_image",   default: 0, null: false
    t.string   "picture"
    t.integer  "gor_clothing_id"
  end

  add_index "images", ["gor_clothing_id"], name: "index_images_on_gor_clothing_id", using: :btree
  add_index "images", ["type_of_image"], name: "index_images_on_type_of_image", unique: true, using: :btree

  create_table "playlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "possible_matches", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "suggested_piece_id"
    t.string   "contemplated_piece_id"
    t.integer  "image_id"
  end

  add_index "possible_matches", ["contemplated_piece_id", "suggested_piece_id"], name: "indexed_possible_match_pair", unique: true, using: :btree

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
    t.integer  "user_id"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "song_name"
    t.string   "artist_name"
    t.integer  "fav_count"
    t.integer  "playlist_id"
    t.integer  "preference_id"
    t.integer  "artist_id"
  end

  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree
  add_index "songs", ["playlist_id"], name: "index_songs_on_playlist_id", using: :btree
  add_index "songs", ["preference_id"], name: "index_songs_on_preference_id", using: :btree
  add_index "songs", ["song_name", "artist_name"], name: "index_songs_on_song_name_and_artist_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_digest"
    t.string   "password_digest"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.boolean  "admin"
    t.string   "full_name"
    t.integer  "gender",          default: 0, null: false
  end

  create_table "wardrobes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "wardrobes", ["user_id"], name: "index_wardrobes_on_user_id", using: :btree

  add_foreign_key "event_tickets", "users"
  add_foreign_key "gor_clothings", "wardrobes"
  add_foreign_key "images", "gor_clothings"
  add_foreign_key "playlists", "users"
  add_foreign_key "possible_matches", "images"
  add_foreign_key "preferences", "users"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "playlists"
  add_foreign_key "songs", "preferences"
  add_foreign_key "wardrobes", "users"
end
