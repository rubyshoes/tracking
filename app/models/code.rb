# == Schema Information
#
# Table name: codes
#
#  id          :integer         not null, primary key
#  code_name   :string(255)
#  status      :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  meta_status :boolean
#

class Code < ActiveRecord::Base
  has_many :codelines, inverse_of: :code
  has_many :contracts, through: :codelines
  
  attr_accessible :code_name, :status, :description, :meta_status

  after_create :remove_dup_code, if: :multiple_codes?
  
  private
  
    def multiple_codes?
      codes = Code.find_all_by_code_name(self.code_name)
      if codes.size > 1
        true
      else
        false
      end
    end
  
    def remove_dup_code
      matching_codes = Code.find_all_by_code_name(self.code_name)
      matching_codes.first.update_attributes(code_name: self.code_name, status: self.status, meta_status: true)
      code_to_delete = Code.find(self.id)
      code_to_delete.update_attributes(meta_status: false)
    end
end
