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

ActiveRecord::Schema.define(:version => 20121126223129) do

  create_table "clients", :force => true do |t|
    t.string   "f_name"
    t.string   "mi"
    t.string   "l_name"
    t.date     "birth_date"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "medicare_num"
    t.string   "medicaid_num"
    t.string   "member_num"
    t.string   "soc_sec_care_mgr"
    t.string   "sscm_ph"
    t.string   "nurse_care_mgr"
    t.string   "ncm_ph"
    t.string   "emer_contact"
    t.string   "ec_ph"
    t.string   "pri_care_phy"
    t.string   "pcp_ph"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "codelines", :force => true do |t|
    t.integer  "contract_id"
    t.integer  "code_id"
    t.integer  "client_id"
    t.decimal  "units_alloc", :precision => 6, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "codes", :force => true do |t|
    t.string   "code_name"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contracts", :force => true do |t|
    t.string   "authnum"
    t.date     "st_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "mi"
    t.string   "marital_status"
    t.string   "gender"
    t.date     "birth_date"
    t.date     "hire_date"
    t.date     "term_date"
    t.string   "primary_position"
    t.string   "trained_position"
    t.string   "email"
    t.boolean  "active"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zip_code"
    t.string   "state"
    t.string   "emp_home_ph"
    t.string   "emp_mobile_ph"
    t.string   "emer_contact_first_name"
    t.string   "emer_contact_last_name"
    t.string   "emer_contact_relationship"
    t.string   "emer_contact_ph"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "role"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                     :default => false
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"

end
