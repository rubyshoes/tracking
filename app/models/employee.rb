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
#  full_name                 :string(255)
#

class Employee < ActiveRecord::Base

  has_secure_password
  
  before_save { |employee| employee.email = employee.email.downcase }

  before_save :create_remember_token

  before_create :de_concatenate

   attr_accessible :first_name, :last_name, :full_name, :marital_status, :gender, :hire_date, :primary_position,
                  :trained_position, :email, :active, :address1, :city, :zip_code, :state, :emp_home_ph, :emp_mobile_ph,
                  :emer_contact_first_name, :emer_contact_last_name, :emer_contact_relationship, :emer_contact_ph, :role,
                  :birth_date, :admin, :password, :password_confirmation

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

  validates(:full_name, presence: true, length: { maximum: 45 })

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
  #def emp_full_name
  #  [first_name, mi, last_name].join(' ')
  #end

  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end

      def de_concatenate
        nam = full_name.split(" ", 3)
          self.first_name = nam.first
          self.last_name = nam.last
        if nam.size == 3
          self.mi = nam[1]
        end
      end
end
