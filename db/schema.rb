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

ActiveRecord::Schema.define(:version => 20130205205411) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["provider"], :name => "index_authentications_on_provider"
  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "cameras", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "brand",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "lenses", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "brand",                               :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.integer  "minimum_focal_length", :default => 0, :null => false
    t.integer  "maximum_focal_length", :default => 0, :null => false
  end

  create_table "nodal_points", :force => true do |t|
    t.integer  "camera_id"
    t.integer  "lens_id"
    t.integer  "focal_length", :null => false
    t.float    "offset",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  add_index "nodal_points", ["camera_id"], :name => "index_nodal_points_on_camera_id"
  add_index "nodal_points", ["lens_id"], :name => "index_nodal_points_on_lens_id"

  create_table "users", :force => true do |t|
    t.string   "name",       :default => ""
    t.string   "email",      :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"

end
