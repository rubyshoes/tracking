# == Schema Information
#
# Table name: clients
#
#  id               :integer         not null, primary key
#  f_name           :string(255)
#  mi               :string(255)
#  l_name           :string(255)
#  birth_date       :date
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip_code         :string(255)
#  medicare_num     :string(255)
#  medicaid_num     :string(255)
#  member_num       :string(255)
#  soc_sec_care_mgr :string(255)
#  sscm_ph          :string(255)
#  nurse_care_mgr   :string(255)
#  ncm_ph           :string(255)
#  emer_contact     :string(255)
#  ec_ph            :string(255)
#  pri_care_phy     :string(255)
#  pcp_ph           :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  name             :string(255)
#

class Client < ActiveRecord::Base
  has_many :contracts, inverse_of: :client
  has_many :codelines, through: :contracts
  
  attr_accessible :f_name, :mi, :l_name, :name

  # TODO Add after_create method to break apart full name into constituent parts
  # Tom, if you'd like to give this a shot, here's some starter pseudo code:
  
      # Split the string based on spaces...string.split(" ", 3) which will return an array
      # The first element in the array should always be the first name, second should be the MI, 
      # but if not entered, then should be the last name. So, use first and last, and check it 
      # the middle element exists (if there are three) and if so, call if the MI 
      # Send each variable into the database in the appropriate field - be sure to call save!

end
