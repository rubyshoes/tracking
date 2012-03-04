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

require 'spec_helper'

describe Codeline do
  pending "add some examples to (or delete) #{__FILE__}"
end
