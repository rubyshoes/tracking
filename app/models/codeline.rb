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

  accepts_nested_attributes_for :code, :contract, :client

  attr_accessible   :code, :code_attributes, :contract, :contract_attributes,
                    :client, :client_attributes, :clients, :clients_attributes,
                    :codes, :codes_attributes, :contracts, :contracts_attributes,
                    :clientline, :clientline_attributes, :clientlines,
                    :clientlines_attributes, :units_alloc
end
