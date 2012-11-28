# == Schema Information
#
# Table name: codelines
#
#  id          :integer         not null, primary key
#  contract_id :integer
#  code_id     :integer
#  units_alloc :decimal(6, 2)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Codeline < ActiveRecord::Base
  belongs_to :code
  belongs_to :contract
  
  attr_accessible :contract_id, :code_id, :units_alloc, :code_attributes
  
  accepts_nested_attributes_for :code

end
