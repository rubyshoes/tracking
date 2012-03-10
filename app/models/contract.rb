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
  accepts_nested_attributes_for :codes

  attr_accessible :clients_attributes, :codes_attributes, :clients, :codes, :contract, :contract_attributes, :authnum, :st_date, :end_date
end
