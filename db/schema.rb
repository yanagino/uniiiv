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

ActiveRecord::Schema.define(version: 2020_09_16_101611) do

  create_table "links", force: :cascade do |t|
    t.integer "junior_id"
    t.integer "senior_id"
    t.string "chat"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["junior_id", "senior_id"], name: "index_links_on_junior_id_and_senior_id", unique: true
    t.index ["junior_id"], name: "index_links_on_junior_id"
    t.index ["senior_id"], name: "index_links_on_senior_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "link_id"
    t.text "message"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_messages_on_link_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "senior_id"
    t.integer "junior_id"
    t.integer "star"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["junior_id", "senior_id"], name: "index_reviews_on_junior_id_and_senior_id", unique: true
    t.index ["junior_id"], name: "index_reviews_on_junior_id"
    t.index ["senior_id"], name: "index_reviews_on_senior_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "nickname"
    t.string "name"
    t.string "image"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

end
