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

ActiveRecord::Schema.define(version: 2018_12_01_132226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "body_weights", force: :cascade do |t|
    t.bigint "rabbit_id"
    t.integer "gram"
    t.datetime "scaled_at"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rabbit_id"], name: "index_body_weights_on_rabbit_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pellet_weight_plans", force: :cascade do |t|
    t.bigint "rabbit_id"
    t.string "name"
    t.jsonb "feeding"
    t.datetime "revised_at"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rabbit_id"], name: "index_pellet_weight_plans_on_rabbit_id"
  end

  create_table "pellet_weights", force: :cascade do |t|
    t.bigint "rabbit_id"
    t.integer "gram"
    t.datetime "fed_at"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rabbit_id"], name: "index_pellet_weights_on_rabbit_id"
  end

  create_table "rabbit_users", force: :cascade do |t|
    t.bigint "rabbit_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rabbit_id"], name: "index_rabbit_users_on_rabbit_id"
    t.index ["user_id"], name: "index_rabbit_users_on_user_id"
  end

  create_table "rabbits", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "birthday"
    t.bigint "breed_id"
    t.datetime "welcomed_at"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "slack_webhook_url"
    t.index ["breed_id"], name: "index_rabbits_on_breed_id"
    t.index ["slug"], name: "index_rabbits_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "slug"
    t.string "email"
    t.string "image"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

end
