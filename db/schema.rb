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

ActiveRecord::Schema.define(:version => 20111206182015) do

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
