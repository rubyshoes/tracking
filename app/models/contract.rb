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
  accepts_nested_attributes_for :codelines

end
