require 'spec_helper'

describe "Employee 'Show, New Employee, Edit' pages" do

  subject { page }

    describe "employee 'profile/show' page" do
      let(:employee) { FactoryGirl.create(:employee) }
      before { visit employee_path(employee) }

      it { should have_selector('h3 img') }
      it { should have_selector('title', text: employee.emp_full_name) }
    end

    describe "new employee addition" do
      before { visit newemployee_path }

      describe "with invalid information" do
        it "should not create a new employee" do
          expect { click_button "Save" }.not_to change(Employee, :count)
        end

        describe "error messages" do
          before { click_button "Save" }
          let(:error) { 'errors prohibited this user from being saved' }

          it { should have_selector('title', text: 'Add Employee') }
          it { should have_content(error) }
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

        describe "after saving the newly added employee" do
          before { click_button "Save" }
          let(:employee) { Employee.find_by_email('spriestly@example.com') }

          it { should have_selector('span1', text: employee.first_name) }
          it { should have_selector('div.flash.success', text: 'New Employee') }
        end
      end
    end

  describe "edit" do
    let(:employee) { FactoryGirl.create(:employee) }
    before do
      sign_in employee
      visit edit_employee_path(employee)
    end

    describe "page" do
      it { should have_selector('h4',     text: "Edit") }
      it { should have_selector('title',  text: "Edit") }
      it { should have_link('change',     href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      describe "error messages" do
        before { click_button "Update" }
        let(:error) { 'errors prohibited this user from being saved' }

        it { should have_content(error) }
      end
    end

    describe "with valid information" do
      let(:employee)          {FactoryGirl.create(:employee) }
      let(:new_first_name)    { employee.first_name }
      let(:new_mi)            { employee.mi}
      let(:new_last_name)     { employee.last_name }
      let(:new_email)         { employee.email }
      let(:new_password)      { employee.password }
      before do
        fill_in "employee_first_name",               with: new_first_name
        fill_in "employee_mi",                       with: new_mi
        fill_in "employee_last_name",                with: new_last_name
        fill_in "employee_email",                    with: new_email
        fill_in "employee_password",                 with: new_password
        fill_in "employee_password_confirmation",    with: new_password
        click_button "Update"
      end

      it { should have_selector('title', text: employee.emp_full_name) }
      it { should have_selector('div.flash.success') }
      specify { employee.reload.first_name.should == new_first_name }
      specify { employee.reload.last_name.should  == new_last_name }
      specify { employee.reload.email.should      == new_email }
    end
  end

  describe "index" do
    let(:employee) { FactoryGirl.create(:employee) }
    before do
      sign_in employee
      visit employees_path
    end

    it { should have_selector('title', text: 'All employees') }

    describe "pagination" do
      before(:all) { 50.times { FactoryGirl.create(:employee) } }
      after(:all)  { Employee.delete_all }

      let(:first_page)    { Employee.paginate(page: 1) }
      let(:second_page)   { Employee.paginate(page: 2) }

      it "should list the first page of employees" do
        first_page.each do |employee|
          page.should have_selector('li', text: employee.emp_full_name)
        end
      end

      it "should not list the second page of employees" do
        second_page.each do |employee|
          page.should_not have_selector('li', text: employee.emp_full_name)
        end
      end

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit employees_path
        end
      end
    end
  end
end
