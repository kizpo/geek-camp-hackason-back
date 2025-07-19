# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_19_081736) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "amount"
    t.bigint "viewer_id", null: false
    t.bigint "stream_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stream_id"], name: "index_comments_on_stream_id"
    t.index ["viewer_id"], name: "index_comments_on_viewer_id"
  end

  create_table "donation_targets", force: :cascade do |t|
    t.string "name", null: false
    t.string "website_url"
    t.text "bank_account_info"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_follows_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_follows_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "streamers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "youtube_url"
    t.string "twitch_url"
    t.integer "donation_share_ratio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_streamers_on_email", unique: true
  end

  create_table "streams", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.bigint "streamer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "stream_url"
    t.index ["streamer_id"], name: "index_streams_on_streamer_id"
  end

  create_table "viewers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_viewers_on_email", unique: true
  end

  add_foreign_key "comments", "streams"
  add_foreign_key "comments", "viewers"
  add_foreign_key "follows", "streamers", column: "followee_id"
  add_foreign_key "follows", "viewers", column: "follower_id"
  add_foreign_key "streams", "streamers"
end
