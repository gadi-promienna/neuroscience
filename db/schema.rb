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

ActiveRecord::Schema.define(version: 20160608185327) do

  create_table "article_topics", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "graphic"
    t.string   "graphic_description"
    t.text     "source"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "article_topic_id"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "graphic"
    t.string   "graphic_description"
    t.text     "source"
  end

  add_index "articles", ["article_topic_id"], name: "index_articles_on_article_topic_id"
  add_index "articles", ["author_id"], name: "index_articles_on_author_id"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bibliography_elements", force: :cascade do |t|
    t.string   "friendly_name"
    t.string   "source"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "graphic"
    t.string   "kind"
    t.string   "graphic_description"
    t.text     "source"
  end

  add_index "news", ["author_id"], name: "index_news_on_author_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "role"
  end

end