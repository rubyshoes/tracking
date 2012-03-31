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
end
