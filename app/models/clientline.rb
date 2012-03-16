# == Schema Information
#
# Table name: clientlines
#
#  id          :integer         not null, primary key
#  contract_id :integer
#  client_id   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Clientline < ActiveRecord::Base
  belongs_to :contract
  belongs_to :client

end
