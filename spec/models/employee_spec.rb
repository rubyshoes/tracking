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
#  hire_date                 :date            not null
#  term_date                 :date
#  primary_position          :string(255)     not null
#  trained_position          :text
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
#  created_at                :datetime        not null
#  updated_at                :datetime        not null
#  role                      :string(255)
#  birth_date                :date
#  password_digest           :string(255)
#  remember_token            :string(255)
#  admin                     :boolean         default(FALSE)
#

require 'spec_helper'

describe Employee do

  before do
    @attr = Employee.new(first_name: "Teress",
      last_name: "Pottle",
      mi: "null",
      marital_status: "Single ",
      gender: "Female",
      birth_date: '1979-09-21',
      hire_date: '2002-01-01',
      term_date: "null",
      active: "true",
      primary_position: "Team Leader",
      trained_position: "Job Development",
      role: "Manager",
      email: "tpottle@example.com",
      address1: "1 First Ave",
      address2: "null",
      city: "Frave",
      zip_code: "54806",
      state: "WI",
      emp_home_ph: "1-111-111-1111",
      emp_mobile_ph: "1-222-222-2222",
      emer_contact_first_name: "Elsine",
      emer_contact_last_name: "Pottle",
      emer_contact_relationship: "Sister",
      emer_contact_ph: "1-333-333-3333",
      admin:  "false",
      password: "foobar",
      password_confirmation: "foobar")
  end

  subject { @attr }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:mi) }
  it { should respond_to(:marital_status) }
  it { should respond_to(:gender) }
  it { should respond_to(:birth_date) }
  it { should respond_to(:hire_date) }
  it { should respond_to(:term_date) }
  it { should respond_to(:active) }
  it { should respond_to(:primary_position) }
  it { should respond_to(:trained_position) }
  it { should respond_to(:role) }
  it { should respond_to(:email) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:state) }
  it { should respond_to(:emp_home_ph) }
  it { should respond_to(:emp_mobile_ph) }
  it { should respond_to(:emer_contact_first_name) }
  it { should respond_to(:emer_contact_last_name) }
  it { should respond_to(:emer_contact_relationship) }
  it { should respond_to(:emer_contact_ph) }
  it { should respond_to(:admin) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  it { should_not be_admin }

  # describe "with admin attribute set to 'true'" do
  #   before { @attr.toggle!(:admin) }
  #   it { should be_admin }
  # end

  describe "when first_name is not present" do
    before { @attr.first_name = " " }
    it { should_not be_valid }
  end

  describe "when first_name is too long" do
    before { @attr.first_name = "a" *26 }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { @attr.last_name = " " }
    it { should_not be_valid }
  end

  describe "when last_name is too long" do
    before { @attr.last_name = "a" *26 }
    it { should_not be_valid }
  end

  describe "when marital_status is not present" do
    before { @attr.marital_status = " " }
    it { should_not be_valid }
  end

  describe "when gender is not present" do
    before { @attr.gender = " " }
    it { should_not be_valid }
  end

  describe "when hire_date is not present" do
    before { @attr.hire_date = " " }
    it { should_not be_valid }
  end

  describe "when primary_position is not present" do
    before { @attr.primary_position = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @attr.email = " " }
    it { should_not be_valid }
  end

  describe "when active is not present" do
    before { @attr.active = " " }
    it { should_not be_valid }
  end

  describe "when address1 is not present" do
    before { @attr.address1 = " " }
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @attr.city = " " }
    it { should_not be_valid }
  end

  describe "when zip_code is not present" do
    before { @attr.zip_code = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @attr.state = " " }
    it { should_not be_valid }
  end

  describe "when birth_date is not present" do
    before { @attr.birth_date = " " }
    it { should_not be_valid }
  end

# AUTHENTICATION and PASSWORD VALIDATIONS

  describe "password validations" do

    describe "when a password is not present" do
      before { @attr.password = @attr.password_confirmation = " " }
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @attr.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "when password confirmation is nil" do
      before { @attr.password_confirmation = nil }      
      it { should_not be_valid }
    end
  end

  describe "return value of authenticate method" do
    before { @attr.save }
    let(:found_employee) { Employee.find_by_email(@attr.email) }

    describe "with valid password" do
      it { should == found_employee.authenticate(@attr.password) }
    end

    describe "with invalid password" do
      let (:employee_for_invalid_password) { found_employee.authenticate("invalid") }
      
      it { should_not == employee_for_invalid_password }
      specify { employee_for_invalid_password.should be_false }
    end
  end

  describe "when a password is too short" do
    before { @attr.password = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when a password is too long" do
    before { @attr.password = "a" * 41 }
    it { should_not be_valid }
  end

# REMEMBER_TOKEN

  describe "remember token" do
    before { @attr.save }
    its(:remember_token) { should_not be_blank }
  end

# EMAIL VALIDATIONS

  describe "when email format is invalid" do
    invalid_addresses = %w[user@foo,com USER_at_foo.org example.user@foo.
                           foo@bar_baz.com foo@bar+baz.com]
                           # this gives us a collection of emails
    invalid_addresses.each do |invalid_address|
      before { @attr.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "when email format is valid" do
    valid_addresses = %w[user@foo.com THE_USER@foo.bar.org 
                         first.last@foo.jp a+b@baz.cn]
                         # this gives us a collection of emails
    valid_addresses.each do |valid_address|
      before { @attr.email = valid_address }
      it { should be_valid }
    end
  end

  describe "when email address is already taken" do
    before do
      employee_with_same_email = @attr.dup
      employee_with_same_email.email = @attr.email.upcase
      employee_with_same_email.save
    end

    it { should_not be_valid }
  end
end
