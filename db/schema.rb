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

ActiveRecord::Schema.define(:version => 20140112042353) do

  create_table "addresses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zipcode"
    t.integer  "country_id"
    t.string   "phone"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "organization"
    t.string   "state_name"
    t.string   "title"
    t.string   "degree"
    t.string   "badge_first_name"
    t.string   "alternative_contact_name"
    t.string   "alternative_contact_phone_or_email"
  end

  create_table "assets", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "attachment_file_size"
    t.string   "type"
    t.datetime "attachment_updated_at"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
  end

  add_index "assets", ["viewable_type", "viewable_id"], :name => "index_assets_on_viewable_type_and_viewable_id"

  create_table "countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "name"
    t.string  "iso3"
    t.integer "numcode"
  end

  create_table "coupons", :force => true do |t|
    t.string   "description"
    t.string   "type"
    t.string   "code"
    t.integer  "usage_count"
    t.datetime "expired_at"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "event_id"
    t.decimal  "amount",         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "precentage"
    t.decimal  "minimum_amount", :precision => 8, :scale => 2
  end

  add_index "coupons", ["expired_at"], :name => "index_coupons_on_expired_at"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "stop_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "address_id"
    t.string   "eid"
  end

  add_index "events", ["eid"], :name => "index_events_on_eid"
  add_index "events", ["name"], :name => "index_events_on_name"
  add_index "events", ["start_at"], :name => "index_events_on_start_at"

  create_table "line_items", :force => true do |t|
    t.integer  "event_id"
    t.decimal  "amount",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "cost",          :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "quantity"
    t.string   "description"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "quantity_used",                               :default => 0,   :null => false
  end

  add_index "line_items", ["event_id"], :name => "index_line_items_on_event_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "total",                        :precision => 8, :scale => 2
    t.string   "referral_url", :limit => 2048
    t.string   "user_agent",   :limit => 512
    t.datetime "paid_at"
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
    t.integer  "event_id"
    t.text     "comment"
    t.string   "number",       :limit => 10,                                 :default => "C10000000", :null => false
    t.integer  "coupon_id"
    t.integer  "line_item_id"
    t.string   "state",        :limit => 100
  end

  add_index "orders", ["number"], :name => "index_orders_on_number"

  create_table "payments", :force => true do |t|
    t.integer  "order_id"
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "type"
    t.boolean  "has_errors"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "presentations", :force => true do |t|
    t.integer  "facilitator_id"
    t.string   "name"
    t.datetime "start_at"
    t.datetime "stop_at"
    t.string   "location"
    t.text     "description"
    t.string   "slide"
    t.string   "type"
  end

  add_index "presentations", ["facilitator_id"], :name => "index_presentations_on_facilitator_id"
  add_index "presentations", ["name"], :name => "index_presentations_on_name"
  add_index "presentations", ["start_at"], :name => "index_presentations_on_start_at"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.integer  "address_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
