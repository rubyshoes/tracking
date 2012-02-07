require 'spec_helper'

describe "Employee pages" do
  subject { page }
    describe "employee show page" do
      let(:employee) { FactoryGirl.create(:employee) }
      before { visit employee_path(employee) }

      it { should have_selector('h3 img') }
      it { should have_selector('title', text: 'Employee') }
    end
end

