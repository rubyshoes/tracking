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
  belongs_to :code, inverse_of: :codelines
  belongs_to :contract
  
  attr_accessible :contract_id, :code_id, :units_alloc, :code_attributes
  
  accepts_nested_attributes_for :code
  
  def code_attributes=(params)
    code_to_save = Code.find_or_create_by_code_name(params[:code_name])
    self.code = code_to_save
    code_to_save.status = params[:status]
    code_to_save.description = params[:description]
    code_to_save.save
  end
  
end
