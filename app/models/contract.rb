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

class Contract < ActiveRecord::Base
  has_many :codelines, :dependent => :destroy
  has_many :codes, through: :codelines
  belongs_to :client, inverse_of: :contracts

  accepts_nested_attributes_for :codes, :allow_destroy => true, :reject_if => lambda { |a| a[:code_name].blank?
                                                                                        a[:status].blank?
                                                                                        a[:description].blank? }

  attr_accessible :clients, :clients_attributes, :codes, :codes_attributes, :codelines, :codelines_attributes,
                  :codeline, :codeline_attributes, :units_alloc, :authnum, :st_date, :end_date, :client_id

end
