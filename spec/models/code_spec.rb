# == Schema Information
#
# Table name: codes
#
#  id          :integer         not null, primary key
#  codename    :string(255)
#  status      :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Code do
  pending "add some examples to (or delete) #{__FILE__}"
end
