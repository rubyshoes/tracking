# == Schema Information
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  authnum    :string(255)
#  client_id  :integer
#  st_date    :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Contract do
  pending "add some examples to (or delete) #{__FILE__}"
end
