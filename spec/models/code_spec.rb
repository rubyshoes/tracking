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
#

require 'spec_helper'

# Testing the associations in the Code Model
describe Code do
  it { should have_many(:codelines) }
  it { should have_many(:contracts).through(:codelines) }
  it { should have_many(:clients).through(:codelines) }
end
