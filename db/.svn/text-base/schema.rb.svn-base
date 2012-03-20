# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081204041653) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_airports", :force => true do |t|
    t.string   "city_name"
    t.string   "airport_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_replies", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "comment_id", :limit => 11
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "write_id",   :limit => 11
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", :force => true do |t|
    t.integer  "user_id",         :limit => 11
    t.text     "about_me"
    t.datetime "birthday"
    t.string   "city"
    t.string   "qq"
    t.string   "gtalk"
    t.string   "msn"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at",                                          :null => false
    t.string   "photo"
    t.string   "sex",                           :default => ""
    t.string   "airport"
    t.string   "web"
    t.string   "is_show_details",               :default => "friend"
    t.string   "is_show_ims",                   :default => "friend"
    t.string   "is_show_works",                 :default => "friend"
  end

  create_table "educations", :force => true do |t|
    t.integer  "user_id",      :limit => 11
    t.string   "name"
    t.string   "professional"
    t.string   "degree"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",     :limit => 11, :null => false
    t.integer  "friend_id",   :limit => 11, :null => false
    t.datetime "created_at"
    t.datetime "accepted_at"
  end

  create_table "lines", :force => true do |t|
    t.integer  "user_id",      :limit => 11
    t.string   "title"
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "startcity"
    t.string   "endcity"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.string   "status"
    t.string   "airlinesname"
  end

  create_table "mailcodes", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "email"
    t.string   "mailcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "reg_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.string   "user_name"
    t.integer  "receiver_id", :limit => 11
    t.string   "title"
    t.text     "content"
    t.string   "smstype",                   :default => "0"
    t.boolean  "isdeleted",                 :default => false
    t.datetime "receive_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flag"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :limit => 11, :null => false
    t.integer  "user_id",    :limit => 11, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "headline"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "name"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
  end

# Could not dump table "works" because of following ActiveRecord::StatementInvalid
#   Mysql::Error: #HY000Can't create/write to file 'C:\Windows\TEMP\#sql_96c_0.MYI' (Errcode: 13): describe `works`

end
