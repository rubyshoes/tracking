# == Schema Information
#
# Table name: employees
#
#  id                        :integer         not null, primary key
#  first_name                :string(255)     not null
#  last_name                 :string(255)     not null
#  mi                        :string(255)
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
    @attr = { :first_name => "Teress",
      :last_name => "Pottle",
      :mi => "null",
      :marital_status => "Single",
      :gender => "Female",
      :birth_date => '1949-08-20',
      :hire_date => '2002-01-01',
      :term_date => "null",
      :active => "true",
      :primary_position => "Job Coach",
      :trained_position => "null",
      :email => "tpottle@example.com",
      :address1 => "1 First Ave",
      :address2 => "null",
      :city => "Frave",
      :zip_code => "54806",
      :state => "WI",
      :emp_home_ph => "null",
      :emp_mobile_ph => "null",
      :emer_contact_first_name => "null",
      :emer_contact_last_name => "null",
      :emer_contact_relationship => "null",
      :emer_contact_ph => "null" }
  end

  it "should create a new instance given valid attributes" do
    $stderr.puts @attr.inspect
    Employee.create!(@attr)
  end

  it "should require a first_name" do
    no_first_name = Employee.new(@attr.merge(:first_name => ""))
    no_first_name.should_not be_valid
  end

  it "should reject first_name that is too long" do
    long_name = "a" * 26
    long_first_name = Employee.new(@attr.merge(:first_name => long_name))
    long_first_name.should_not be_valid
  end

  it "should require a last_name" do
    no_last_name = Employee.new(@attr.merge(:last_name => ""))
    no_last_name.should_not be_valid
  end

  it "should reject a last_name that is too long" do
    long_name = "a" * 26
    long_last_name = Employee.new(@attr.merge(:last_name => long_name))
    long_last_name.should_not be_valid
  end

  it "should require a marital_status" do
    no_marital_status = Employee.new(@attr.merge(:marital_status => ""))
    no_marital_status.should_not be_valid
  end

  it "should require a gender" do
    no_gender = Employee.new(@attr.merge(:gender => ""))
    no_gender.should_not be_valid
  end

  it "should require a birth_date" do
    no_birth_date = Employee.new(@attr.merge(:birth_date => ""))
    no_birth_date.should_not be_valid
  end

  it "should require a hire_date" do
    no_hire_date = Employee.new(@attr.merge(:hire_date => ""))
    no_hire_date.should_not be_valid
  end

  it "should require a primary_position" do
    no_primary_position = Employee.new(@attr.merge(:primary_position => ""))
    no_primary_position.should_not be_valid
  end

  it "should require a email" do
    no_email = Employee.new(@attr.merge(:email => ""))
    no_email.should_not be_valid
  end

  it "should require an 'active' setting" do
    no_active_setting = Employee.new(@attr.merge(:active => ""))
    no_active_setting.should_not be_valid
  end

  it "should require an address1" do
    no_address1 = Employee.new(@attr.merge(:address1 => ""))
    no_address1.should_not be_valid
  end

  it "should require a city" do
    no_city = Employee.new(@attr.merge(:city => ""))
    no_city.should_not be_valid
  end

  it "should require a zip_code" do
    no_zip_code = Employee.new(@attr.merge(:zip_code => ""))
    no_zip_code.should_not be_valid
  end

  it "should require a state" do
    no_state = Employee.new(@attr.merge(:state => ""))
    no_state.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] # this gives us a collection of emails
    addresses.each do |address|
      valid_email_employee = Employee.new(@attr.merge(:email => address))
      valid_email_employee.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_employee = Employee.new(@attr.merge(:email => address))
      invalid_email_employee.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put an employee with a given email address into the database.
    $stderr.puts @attr.inspect
    Employee.create!(@attr)
    employee_with_duplicate_email = Employee.new(@attr)
    employee_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Employee.create!(@attr.merge(:email => upcased_email))
    employee_with_upcase_email = Employee.new(@attr)
    employee_with_upcase_email.should_not be_valid
  end

  it "should save email addresses in lowercase form" do
    employee = Employee.create!(@attr.merge(:email => @attr[:email].upcase))
    employee.email.should == @attr[:email] # see model for before_save(:downcase_email) and its definition
  end
end
