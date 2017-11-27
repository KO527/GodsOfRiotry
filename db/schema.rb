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

ActiveRecord::Schema.define(version: 20170827053551) do

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
    t.string   "name"
  end

  create_table "event_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "venue"
    t.datetime "happening"
    t.string   "name"
    t.integer  "fav_count"
    t.integer  "user_id"
    t.string   "artist_id"
  end

  add_index "event_tickets", ["happening"], name: "index_event_tickets_on_happening", unique: true
  add_index "event_tickets", ["user_id"], name: "index_event_tickets_on_user_id"

  create_table "gor_clothings", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.float    "price"
    t.text     "description"
    t.float    "sizes"
    t.integer  "quantity"
    t.integer  "gender",           default: 0,     null: false
    t.integer  "status",           default: 0,     null: false
    t.string   "colors_available"
    t.integer  "wardrobe_id"
    t.boolean  "standalone",       default: false
  end

  add_index "gor_clothings", ["wardrobe_id"], name: "index_gor_clothings_on_wardrobe_id"

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "type_of_image",   default: 0, null: false
    t.string   "picture"
    t.integer  "gor_clothing_id"
  end

  add_index "images", ["gor_clothing_id"], name: "index_images_on_gor_clothing_id"
  add_index "images", ["type_of_image"], name: "index_images_on_type_of_image", unique: true

  create_table "playlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"

  create_table "possible_matches", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "suggested_piece_id"
    t.string   "contemplated_piece_id"
    t.integer  "image_id"
  end

  add_index "possible_matches", ["contemplated_piece_id", "suggested_piece_id"], name: "indexed_possible_match_pair", unique: true

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fav_count"
    t.integer  "user_id"
    t.string   "artists_id"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "fav_count"
    t.integer  "playlist_id"
    t.integer  "preference_id"
    t.integer  "artist_id"
    t.string   "favorite_tally"
    t.string   "name"
  end

  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id"
  add_index "songs", ["playlist_id"], name: "index_songs_on_playlist_id"
  add_index "songs", ["preference_id"], name: "index_songs_on_preference_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "remember_digest"
    t.string   "password_digest"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.integer  "provider_followers_count"
    t.string   "access_token"
    t.boolean  "admin"
    t.string   "full_name"
    t.integer  "gender",                   default: 0, null: false
    t.string   "soundcloud_full_name"
    t.integer  "role",                     default: 0
  end

  create_table "wardrobes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "wardrobes", ["user_id"], name: "index_wardrobes_on_user_id"

end
