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
  has_many :codelines, :dependent => :destroy
  has_many :contracts, through: :codelines
  has_many :clients, through: :codelines

  accepts_nested_attributes_for :codelines, :contracts
  attr_accessible :codelines, :codelines_attributes, :contracts, :contracts_attributes, :code_name, :status, :description

  # before_create :check_existence
  # 
  # private
  # 
  #   def check_existence
  #     Code.all.each do |code|
  #       code.update_attributes(code.code_name = ) if code.code_name == self.code_name
  #     end
  #   end

end