# == Schema Information
#
# Table name: employees
#
#  id                        :integer         not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  mi                        :text
#  marital_status            :string(255)
#  gender                    :string(255)
#  birth_date                :date
#  hire_date                 :date
#  term_date                 :date
#  primary_position          :string(255)
#  trained_position          :string(255)
#  email                     :string(255)
#  active                    :boolean
#  address1                  :string(255)
#  address2                  :string(255)
#  city                      :string(255)
#  zip_code                  :string(255)
#  state                     :string(255)
#  emp_home_ph               :string(255)
#  emp_mobile_ph             :string(255)
#  emer_contact_first_name   :string(255)
#  emer_contact_last_name    :string(255)
#  emer_contact_relationship :string(255)
#  emer_contact_ph           :string(255)
#  created_at                :datetime        not null
#  updated_at                :datetime        not null
#  role                      :string(255)
#  password_digest           :string(255)
#  remember_token            :string(255)
#  admin                     :boolean         default(FALSE)
#

class Employee < ActiveRecord::Base

  has_secure_password
  
  before_save { |employee| employee.email = employee.email.downcase }

  before_save :create_remember_token

  attr_accessor :emp_full_name

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

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
            :hire_date, presence: true)

  validates(:email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false })

  # Automatically create the virtual attribute 'password_confirmation'.
  validates( :password, confirmation:         true,
                        length:               { :within => 6..40 })

  validates :password_confirmation, presence: true

  # defines the virtual attribute 'emp_full_name'
  def emp_full_name
    [first_name, mi, last_name].join(' ')
  end

  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
end
