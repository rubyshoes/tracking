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
#  birth_date                :date            default(Sun, 21 Sep 1986), not null
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
#  created_at   #             :datetime        not null
#  updated_at                :datetime        not null
#  encrypted_password        :string(255)
#

class Employee < ActiveRecord::Base

   attr_accessor :password
 # attr_accessible :password, :password_confirmatiom, :first_name, :last_name, :email

 # date_regex = /^[0-9]{2}[-][0-9]{2}[-]{4}$/

  email_regex = /([\w+.]+)@[a-z0-9\-.]+\.[a-z]+/i

  validates(:marital_status,
            :gender,
            :primary_position,
            :active,
            :address1,
            :city,
            :zip_code,
            :state, :presence => true)

  validates(:first_name,
            :last_name,
            :presence => true,
            :length => { :maximum => 25 })

  validates(:birth_date,
            :hire_date, :presence => true)
 #           :format => { :with => date_regex })

  validates(:email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false})

  # Automatically create the virtual attribute 'password_confirmation'.
  validates( :password, :presence  => true,
             :confirmation         => true,
             :length               => { :within => 6..40 })

  before_save :downcase_email, :encrypt_password

  # Return true if the employee's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    employee = find_by_email(email)
    return nil if employee.nil?
    return employee if employee.has_password?(submitted_password)
  end

  # create a virtual attribute 'emp_full_name'
#  def emp_full_name
 #   [first_name, last_name].join(' ')
 # end

  # allow for the full_name to be split back into two
 # def full_name=(name)
  #  split = name.split(' ', 2)
   # self.first_name = split.first
   # self.last_name = split.last
 # end

private
  def downcase_email
    self.email.downcase!
  end

  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
