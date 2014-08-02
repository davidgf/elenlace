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

ActiveRecord::Schema.define(version: 20140729113407) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "attendees", force: true do |t|
    t.string   "auth_token"
    t.string   "password"
    t.string   "username"
    t.string   "role"
    t.integer  "table_id"
    t.integer  "wedding_id"
    t.text     "description",         default: "", null: false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "attendees", ["table_id"], name: "index_attendees_on_table_id"
  add_index "attendees", ["wedding_id"], name: "index_attendees_on_wedding_id"

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "attendee_id"
    t.string   "role",             default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["attendee_id"], name: "index_comments_on_attendee_id"
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"

  create_table "dances", force: true do |t|
    t.integer  "attendee_id"
    t.integer  "partner_id"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dances", ["attendee_id"], name: "index_dances_on_attendee_id"
  add_index "dances", ["partner_id"], name: "index_dances_on_partner_id"

  create_table "events", force: true do |t|
    t.datetime "datetime"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "messages", force: true do |t|
    t.text     "message",            default: "", null: false
    t.integer  "attendee_id"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.integer  "cached_votes_score", default: 0
  end

  add_index "messages", ["attendee_id"], name: "index_messages_on_attendee_id"
  add_index "messages", ["cached_votes_down"], name: "index_messages_on_cached_votes_down"
  add_index "messages", ["cached_votes_score"], name: "index_messages_on_cached_votes_score"
  add_index "messages", ["cached_votes_up"], name: "index_messages_on_cached_votes_up"

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.integer  "attendee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.integer  "cached_votes_score", default: 0
  end

  add_index "pictures", ["attendee_id"], name: "index_pictures_on_attendee_id"
  add_index "pictures", ["cached_votes_down"], name: "index_pictures_on_cached_votes_down"
  add_index "pictures", ["cached_votes_score"], name: "index_pictures_on_cached_votes_score"
  add_index "pictures", ["cached_votes_up"], name: "index_pictures_on_cached_votes_up"

  create_table "songs", force: true do |t|
    t.string   "artist"
    t.string   "title"
    t.integer  "wedding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.integer  "attendee_id"
    t.integer  "cached_votes_score", default: 0
  end

  add_index "songs", ["cached_votes_down"], name: "index_songs_on_cached_votes_down"
  add_index "songs", ["cached_votes_score"], name: "index_songs_on_cached_votes_score"
  add_index "songs", ["cached_votes_up"], name: "index_songs_on_cached_votes_up"

  create_table "tables", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wedding_id"
  end

  add_index "tables", ["wedding_id"], name: "index_tables_on_wedding_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "weddings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
