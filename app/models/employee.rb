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
#  birth_date                :date            not null
#  password_digest           :string(255)     not null
#  remember_token            :string(255)     not null
#

class Employee < ActiveRecord::Base

  has_secure_password

  before_save :create_remember_token

  attr_accessor :emp_full_name

  email_regex = /([\w+.]+)@[a-z0-9\-.]+\.[a-z]+/i

  validates(:marital_status,
            :gender,
            :primary_position,
            :active,
            :address1,
            :city,
            :zip_code,
            :state, presence: true)

  validates(:first_name,
            :last_name,
            presence: true,
            length: { maximum: 25 })

  validates(:emp_full_name, presence: true, length: { maximum: 45 })

  validates(:birth_date,
            :hire_date, :presence => true)

  validates(:email, presence: true,
            format: { with: email_regex },
            uniqueness: { case_sensitive: false })

  # Automatically create the virtual attribute 'password_confirmation'.
  validates( :password, presence:             true,
                        confirmation:         true,
                        length:               { :within => 6..40 })

  # defines the virtual attribute 'emp_full_name'
  def emp_full_name
    [first_name, last_name].join(' ')
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
