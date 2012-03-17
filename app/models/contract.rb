# == Schema Information
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  authnum    :string(255)
#  client_id  :integer
#  st_date    :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Contract < ActiveRecord::Base
  has_many :clientlines
  has_many :codelines
  has_many :clients, :through => :clientlines
  has_many :codes, :through => :codelines

  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :codelines, :reject_if => lambda { |a| a[:units_alloc].blank? }
  accepts_nested_attributes_for :codes, :reject_if => lambda { |a| a[:codename].blank?
                                                                   a[:status].blank?
                                                                   a[:description].blank? }

  attr_accessible :clients_attributes, :codes_attributes, :codelines, :codelines_attributes, :clients, :contract, :contract_attributes, :code, :code_attributes, :client, :client_attributes, :codes, :authnum, :st_date, :end_date

end
