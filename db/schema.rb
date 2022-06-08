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

ActiveRecord::Schema.define(version: 2022_06_08_063711) do

  create_table "applications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "token", null: false
    t.string "name", null: false
    t.integer "chats_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_applications_on_token", unique: true
  end

  create_table "chats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "application_token", null: false
    t.integer "chat_number", null: false
    t.integer "messages_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_token", "chat_number"], name: "index_chats_on_application_token_and_chat_number", unique: true
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "body", null: false
    t.string "application_token", null: false
    t.integer "chat_number", null: false
    t.integer "message_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_token", "chat_number", "message_number"], name: "index_chats_on_application_token_chat_number_message_number", unique: true
  end

  add_foreign_key "chats", "applications", column: "application_token", primary_key: "token"
  add_foreign_key "messages", "chats", column: "application_token", primary_key: "application_token", name: "messages_ibfk_1"
  add_foreign_key "messages", "chats", column: "chat_number", primary_key: "chat_number", name: "messages_ibfk_1"
end
