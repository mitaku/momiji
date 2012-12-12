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

ActiveRecord::Schema.define(:version => 20121212153002) do

  create_table "chocoholic_contents", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "company_id"
    t.integer  "owner_id"
    t.string   "ancestry"
    t.string   "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "chocoholic_contents", ["ancestry"], :name => "index_chocoholic_contents_on_ancestry"
  add_index "chocoholic_contents", ["company_id", "owner_id"], :name => "index_chocoholic_contents_on_company_id_and_owner_id"
  add_index "chocoholic_contents", ["type", "company_id"], :name => "index_chocoholic_contents_on_type_and_company_id"

end
