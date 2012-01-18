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

ActiveRecord::Schema.define(:version => 20120112194649) do

  create_table "employees", :force => true do |t|
    t.string   "first_name",                                  :null => false
    t.string   "last_name",                                   :null => false
    t.string   "mi"
    t.string   "marital_status",                              :null => false
    t.string   "gender",                                      :null => false
    t.date     "hire_date",                                   :null => false
    t.date     "term_date"
    t.string   "primary_position",                            :null => false
    t.text     "trained_position"
    t.string   "email",                                       :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.string   "address1",                                    :null => false
    t.string   "address2"
    t.string   "city",                                        :null => false
    t.string   "zip_code",                                    :null => false
    t.string   "state",                                       :null => false
    t.string   "emp_home_ph"
    t.string   "emp_mobile_ph"
    t.string   "emer_contact_first_name"
    t.string   "emer_contact_last_name"
    t.string   "emer_contact_relationship"
    t.string   "emer_contact_ph"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "role"
    t.date     "birth_date"
    t.string   "password_digest"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true

end
