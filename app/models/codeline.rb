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
  
  after_create :update_code_id, if: :multiple_codes?
  
  private
  
    def multiple_codes?
      codeline = Codeline.find_by_id(self.id)
      code = Code.find(self.code_id)
      codes = Code.find_all_by_code_name(code.code_name)
      if codes.size > 1
        true
      else
        false
      end
    end
  
    def update_code_id
      codeline = Codeline.find_by_id(self.id)
      code = Code.find(self.code_id)
      codes = Code.find_all_by_code_name(code.code_name)
      codeline.update_attributes(code_id: codes.first.id)
      code_to_destroy = Code.find(codes.last.id)
      code_to_destroy.destroy
    end
end
