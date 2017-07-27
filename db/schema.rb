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

ActiveRecord::Schema.define(version: 20170727032822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "path"
    t.string   "title"
    t.string   "blurb"
    t.string   "permalink"
    t.string   "current_commit"
    t.boolean  "just_added"
    t.boolean  "processing"
    t.integer  "notes_count",    default: 0
    t.boolean  "hidden",         default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "position"
    t.string   "title"
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "part"
    t.string   "permalink"
    t.index ["book_id", "part"], name: "index_chapters_on_book_id_and_part", using: :btree
    t.index ["book_id", "permalink"], name: "index_chapters_on_book_id_and_permalink", using: :btree
    t.index ["book_id"], name: "index_chapters_on_book_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "note_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_comments_on_note_id", using: :btree
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "chapter_id"
    t.string   "tag"
    t.string   "title"
    t.string   "nickname"
    t.text     "content"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "old",         default: false
    t.integer  "notes_count", default: 0
    t.index ["chapter_id"], name: "index_elements_on_chapter_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "chapter_id"
    t.string   "filename"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["chapter_id"], name: "index_images_on_chapter_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.text     "text"
    t.integer  "element_id"
    t.integer  "number"
    t.string   "state",      default: "new"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["element_id"], name: "index_notes_on_element_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "author",                 default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
