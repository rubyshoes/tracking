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

class Employee < ActiveRecord::Base

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

  before_save :downcase_email

private
  def downcase_email
    self.email.downcase!
  end
end
