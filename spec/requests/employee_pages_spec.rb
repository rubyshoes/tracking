require 'spec_helper'

describe "Employee 'Show and New Employee' pages" do

  subject { page }

    describe "employee show page" do
      let(:employee) { FactoryGirl.create(:employee) }
      before { visit employee_path(employee) }

      it { should have_selector('h3 img') }
      it { should have_selector('title', text: 'Employee') }
    end

    describe "new employee addition" do

      before { visit newemployee_path }

      describe "with invalid information" do
        it "should not create a new employee" do
          expect { click_button "Save" }.not_to change(Employee, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "employee_first_name",                   with: "Sharon"
          fill_in "employee_last_name",                    with: "Priestly"
          fill_in "employee_mi",                           with: "null"
          fill_in "employee_marital_status",               with: "Single"
          fill_in "employee_gender",                       with: "Female"
          fill_in "employee_birth_date",                   with: '1979-11-03'
          fill_in "employee_hire_date",                    with: '2002-01-01'
          fill_in "employee_term_date",                    with: "null"
          check   "employee_active"
          fill_in "employee_primary_position",             with: "Household"
          fill_in "employee_trained_position",             with: "Job Coach"
	        fill_in "employee_role",                         with: "Staff"
          fill_in "employee_email",                        with: "spriestly@example.com"
          fill_in "employee_address1",                     with: "1 First Ave"
          fill_in "employee_address2",                     with: "null"
          fill_in "employee_city",                         with: "Frave"
          fill_in "employee_zip_code",                     with: "54806"
          fill_in "employee_state",                        with: "WI"
          fill_in "employee_emp_home_ph",                  with: "1-111-111-1111"
          fill_in "employee_emp_mobile_ph",                with: "1-222-222-2222"
          fill_in "employee_emer_contact_first_name",      with: "Rosalind"
          fill_in "employee_emer_contact_last_name",       with: "Priestly"
          fill_in "employee_emer_contact_relationship",    with: "Sister"
          fill_in "employee_emer_contact_ph",              with: "1-333-333-3333"
          fill_in "employee_password",                     with: "foobar"
          fill_in "employee_password_confirmation",        with: "foobar"
        end

        it "should create a new employee" do
          expect { click_button "Save" }.to change(Employee, :count).by(1)
        end
      end
    end
end

