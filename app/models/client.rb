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
#

class Client < ActiveRecord::Base
  has_many :clientlines
  has_many :contracts, :through => :clientlines
end
