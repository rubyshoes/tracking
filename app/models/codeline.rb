# == Schema Information
#
# Table name: codelines
#
#  id          :integer         not null, primary key
#  contract_id :integer
#  code_id     :integer
#  client_id   :integer
#  units_alloc :decimal(6, 2)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Codeline < ActiveRecord::Base
  belongs_to :code, inverse_of: :codelines
  belongs_to :contract
  
  attr_accessible :contract_id, :code_id, :units_alloc, :code_attributes
  
  accepts_nested_attributes_for :code, :allow_destroy => true, :reject_if => lambda { |a| a[:code_name].blank?
                                                                                          a[:status].blank?
                                                                                          a[:description].blank? }
                                                                                          
  validates(:code_id, :units_alloc, presence: true)
  validates(:units_alloc, numericality: true)
  
  # When you declare an association, you can then think of the code_attributes as an extension of the declaring model.
  # This setter method is like any other, expect it happens to accept an array of attributes. 
  # We call find_or_create to see if an existing record is in the database. If not, then we create one. We assign it
  # to self (in this case, the codeline object) and then go through the attributes and update them (in case they)
  # were changed during the contract creation process. Finally, we need to call save to make sure the insert statement
  # updates the database record and not just our in memory object.
  
  def code_attributes=(params)
    code_to_save = Code.find_or_create_by_code_name(params[:code_name])
    self.code = code_to_save
    code_to_save.status = params[:status]
    code_to_save.description = params[:description]
    code_to_save.save
  end
  
end
