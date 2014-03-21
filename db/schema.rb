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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140321111048) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "create_user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "groups", ["create_user_id"], :name => "index_groups_on_create_user_id"

  create_table "items", :force => true do |t|
    t.integer  "shop_id"
    t.string   "item_name"
    t.integer  "category_id"
    t.integer  "target_gender_id"
    t.text     "image_url"
    t.string   "comment1"
    t.string   "comment2"
    t.integer  "price"
    t.text     "memo1"
    t.text     "memo2"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "reputations", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "reputation"
    t.integer  "rank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reputations", ["item_id"], :name => "index_reputations_on_item_id"
  add_index "reputations", ["shop_id"], :name => "index_reputations_on_shop_id"
  add_index "reputations", ["user_id"], :name => "index_reputations_on_user_id"

  create_table "shops", :force => true do |t|
    t.string   "shop_name"
    t.integer  "create_user_id"
    t.string   "zip_cd"
    t.string   "address"
    t.string   "phone"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "time_info"
    t.text     "shop_info"
    t.text     "memo1"
    t.text     "memo2"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "target_ages", :force => true do |t|
    t.string   "target_age_range"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "passwd"
    t.string   "email"
    t.integer  "gender_id"
    t.string   "address"
    t.text     "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
