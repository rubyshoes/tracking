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
#

class Contract < ActiveRecord::Base
#  has_many :clientlines
  has_many :codelines, :dependent => :destroy
#  has_many :clients, through: :clientlines
  has_many :codes, through: :codelines
  has_many :clients, through: :codelines

#  accepts_nested_attributes_for :clients
#  accepts_nested_attributes_for :codelines, :allow_destroy => true , :reject_if => lambda { |a| a[:units_alloc].blank? }
#  accepts_nested_attributes_for :codes, :allow_destroy => true, :reject_if => lambda { |a| a[:code_name].blank?
#                                                                                        a[:status].blank?
#                                                                                        a[:description].blank? }

#  attr_accessible :clients, :clients_attributes, :codes, :codes_attributes, :codelines, :codelines_attributes,
#                  :codeline, :codeline_attributes, :units_alloc, :authnum, :st_date, :end_date

end
