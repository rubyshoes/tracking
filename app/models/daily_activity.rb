# == Schema Information
#
# Table name: daily_activities
#
#  id               :integer         not null, primary key
#  employee_id      :integer
#  code_id          :integer
#  contract_id      :integer
#  codeline_id      :integer
#  client_id        :integer
#  day              :date
#  start            :date
#  end              :date
#  direct_time      :decimal(6, 2)
#  indirect_time    :decimal(6, 2)
#  general_training :decimal(6, 2)
#  general_meeting  :decimal(6, 2)
#  other            :decimal(6, 2)
#  comp_time_taken  :decimal(6, 2)
#  comment          :string(255)
#  employee_name    :string(255)
#  client_name      :string(255)
#  code_name        :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class DailyActivity < ActiveRecord::Base
	
  attr_accessible :client_id, :client_name, :code_id, :code_name, :codeline_id, :comment, :comp_time_taken, :contract_id, :day, :direct_time, :employee_id, :employee_name, :end, :general_meeting, :general_training, :indirect_time, :other, :start
end
