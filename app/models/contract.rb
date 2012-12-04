# == Schema Information
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  authnum    :string(255)
#  st_date    :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  client_id  :integer
#

class Contract < ActiveRecord::Base
  belongs_to :client, inverse_of: :contracts
  has_many :codelines
  has_many :codes, through: :codelines
  
  attr_accessible :authnum, :st_date, :end_date, :client_id, :clients, :client_attributes, :codelines, :codelines_attributes
  
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :codelines, allow_destroy: true, :reject_if => lambda { |a| a[:units_alloc].blank? }
  
  # See codeline model for explanation of this pattern and how to utilize the associations.
  
  def client_attributes=(params)
    client_to_save = Client.find_or_create_by_name(params[:name])
    self.client = client_to_save
    client_to_save.birth_date = params[:birth_date]
    client_to_save.address1 = params[:address1]
    client_to_save.address2 = params[:address2]
    client_to_save.city = params[:city]
    client_to_save.state = params[:state]
    client_to_save.zip_code = params[:zip_code]
    client_to_save.medicare_num = params[:medicare_num]
    client_to_save.medicaid_num = params[:medicaid_num]
    client_to_save.member_num = params[:member_num]
    client_to_save.soc_sec_care_mgr = params[:soc_sec_care_mgr]
    client_to_save.sscm_ph = params[:sscm_ph]
    client_to_save.nurse_care_mgr = params[:nurse_care_mgr]
    client_to_save.ncm_ph = params[:ncm_ph]
    client_to_save.emer_contact = params[:emer_contact]
    client_to_save.ec_ph = params[:ec_ph]
    client_to_save.pri_care_phy = params[:pri_care_phy]
    client_to_save.pcp_ph = params[:pcp_ph]
    client_to_save.save
  end

end
