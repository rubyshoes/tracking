# == Schema Information
#
# Table name: employees
#
#  id                        :integer         not null, primary key
#  first_name                :string(255)     not null
#  last_name                 :string(255)     not null
#  mi                        :text
#  marital_status            :string(255)     not null
#  gender                    :string(255)     not null
#  birth_date                :date            default(Sat, 20 Aug 1949), not null
#  hire_date                 :date            not null
#  term_date                 :date
#  primary_position          :string(255)     not null
#  trained_position          :string(255)
#  email                     :string(255)     not null
#  active                    :boolean         default(TRUE), not null
#  address1                  :string(255)     not null
#  address2                  :string(255)
#  city                      :string(255)     not null
#  zip_code                  :string(255)     not null
#  state                     :string(255)     not null
#  emp_home_ph               :string(255)
#  emp_mobile_ph             :string(255)
#  emer_contact_first_name   :string(255)
#  emer_contact_last_name    :string(255)
#  emer_contact_relationship :string(255)
#  emer_contact_ph           :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#

class Employee < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :mi, :marital_status, :gender, :birth_date, :hire_date, :term_date, :primary_position, :trained_position, :email, :active, :address1, :address2, :city, :zip_code, :state, :emp_home_ph, :emp_mobile_ph, :emer_contact_first_name, :emer_contact_last_name, :emer_contact_relationship, :emer_contact_ph

 validates(:first_name, :last_name, :marital_status, :gender, :birth_date,
 :hire_date, :primary_position, :email, :active, :address1, :city,
 :zip_code, :state, :presence => true)
end
