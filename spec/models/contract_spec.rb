# == Schema Information
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  authnum    :string(255)
#  st_date    :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  client_id  :integer
#

require 'spec_helper'

# Testing the associations in the Contract Model.
describe Contract do
  it { should have_many(:codelines) }
  it { should have_many(:codes).through(:codelines) }
  it { should have_many(:clients).through(:codelines) }
end
