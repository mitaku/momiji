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

ActiveRecord::Schema.define(:version => 20121219085437) do

  create_table "chocoholic_contents", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "company_id"
    t.integer  "owner_id"
    t.string   "ancestry"
    t.string   "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "file_size"
  end

  add_index "chocoholic_contents", ["ancestry"], :name => "index_chocoholic_contents_on_ancestry"
  add_index "chocoholic_contents", ["company_id", "owner_id"], :name => "index_chocoholic_contents_on_company_id_and_owner_id"
  add_index "chocoholic_contents", ["type", "company_id"], :name => "index_chocoholic_contents_on_type_and_company_id"

  create_table "chocoholic_permissions", :force => true do |t|
    t.string   "resource_type"
    t.integer  "content_id"
    t.integer  "resource_id"
    t.boolean  "writable",      :default => false, :null => false
    t.boolean  "readonly",      :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "chocoholic_permissions", ["content_id"], :name => "index_chocoholic_permissions_on_content_id"
  add_index "chocoholic_permissions", ["resource_id", "resource_type"], :name => "index_chocoholic_permissions_on_resource_id_and_resource_type"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
