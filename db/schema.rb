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

ActiveRecord::Schema.define(:version => 20130205134113) do

  create_table "cameras", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "brand",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lens", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "brand",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodal_points", :force => true do |t|
    t.integer  "camera_id"
    t.integer  "lens_id"
    t.integer  "focal_length", :null => false
    t.float    "offset",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "nodal_points", ["camera_id"], :name => "index_nodal_points_on_camera_id"
  add_index "nodal_points", ["lens_id"], :name => "index_nodal_points_on_lens_id"

end