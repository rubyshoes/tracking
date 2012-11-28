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

class Code < ActiveRecord::Base
  has_many :codelines
  has_many :contracts, through: :codelines
  
  attr_accessible :code_name, :status, :description

end