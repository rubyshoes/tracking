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
  belongs_to :contract
  belongs_to :code
  belongs_to :client

  accepts_nested_attributes_for :code, :allow_destroy => true, 
                               :reject_if => lambda { |a| a[:code_name].blank?
                                                          a[:status].blank?
                                                          a[:description].blank?
                                                    }

  accepts_nested_attributes_for :contract, :client, allow_destroy: true
  attr_accessible :code, :code_attributes, :contract, :contract_attributes,
                  :client, :client_attributes, :clients, :clients_attributes,
                  :codes, :codes_attributes, :contracts, :contracts_attributes,
                  :units_alloc, :code_id, :contract_id, :client_id

                  validates(:contract_id,
                            :client_id,
                            :code_id,
                            :units_alloc, presence: true)
                  validates(:units_alloc, numericality: true)
end
