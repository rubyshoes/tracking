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

class Code < ActiveRecord::Base
  has_many :codelines
  has_many :contracts, :through => :codelines

  accepts_nested_attributes_for :codelines, :contracts
end
