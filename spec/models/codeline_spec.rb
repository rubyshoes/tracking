# == Schema Information
#
# Table name: codelines
#
#  id          :integer         not null, primary key
#  contract_id :integer
#  code_id     :integer
#  units_alloc :decimal(6, 2)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Codeline do

    context 'relationships' do
      it { should belong_to(:contract) }
      it { should belong_to(:code) }
    end

    context 'validations' do
      it { should_not allow_mass_assignment_of(:password) }
      it { should validate_numericality_of(:units_alloc) }
 #     it { should validate_presence_of(:contract_id) }
 #     it { should validate_presence_of(:code_id) }
 #     it { should validate_presence_of(:client_id) }
      it { should have_db_column(:id).with_options(:primary => true) }
    end
end
