require 'spec_helper'

describe "Authorization" do

  describe "for non-signed-in employees" do
    let(:employee) {FactoryGirl.create(:employee) }

    describe "in the Employees controller" do

      describe "submitting to the update action" do
        before { put employee_path(employee) } # the put gets us to the update 
        specify { response.should redirect_to(signin_path) }
      end
    end
  end
end