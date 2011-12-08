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

require 'spec_helper'

describe Employee do

  before(:each) do
    @attr = { :first_name => "Teress", :last_name => "Pottle", :marital_status => "Single", :gender => "Female", :birth_date => '1987-04-20', :hire_date => '2002-01-01', :primary_position => "Job Coach", :email => "tpottle@example.com", :address1 => "1 First Ave", :city => "Frave", :zip_code => "54806", :state => "WI" }
  end

  it "should create a new instance given valid attributes" do
    Employee.create!(@attr)
  end

  it "should require a first_name"
end
