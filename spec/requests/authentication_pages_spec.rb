require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    it { should have_selector('h2',     text: 'Sign in') }
    it { should have_selector('title',  text: 'Sign in') }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.flash.error', text: 'Invalid') }
      end
    end

    describe "with valid information" do
      let(:employee) { FactoryGirl.create(:employee) }
      before { valid_signin(employee) }

      it { should have_selector('title',     text: employee.emp_full_name) }

      it { should have_link('Employees',     href: employees_path) }
      it { should have_link('Profile',       href: employee_path(employee)) }
      it { should have_link('Settings',      href: edit_employee_path(employee)) }
      it { should have_link('Sign out',      href: signout_path) }

      it { should_not have_link('Sign in',   href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

  describe "Authorization" do

    describe "for non-signed-in employees" do
      let(:employee) {Factory(:employee) }

      describe "in the Employees controller" do

        describe "visting the edit page" do
          before { visit edit_employee_path(employee) }
          it { should have_selector('title', text: 'Sign in') }
        end

        describe "submitting to the update action" do
          before { put employee_path(employee) }
          specify { response.should redirect_to(signin_path) }
        end
      end

      describe "as wrong employee" do
        let(:employee) { FactoryGirl.create(:employee) }
        let(:wrong_employee) { FactoryGirl.create(:employee, email: "wrong@example.com") }
        before { sign_in employee }

        describe "visiting Employees#edit page" do
          before { visit edit_employee_path(wrong_employee) }
          it { should have_selector('title', text: 'Home') }
        end

        describe "submitting a PUT request to the Employees#update action" do
          before { put employee_path(wrong_employee) }
          specify { response.should redirect_to(root_path) }
        end
      end

      describe " when attempting to visit a protected page" do
        before do
          visit edit_employee_path(employee)
          fill_in "Email",        with: employee.email
          fill_in "Password",     with: employee.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit')
          end

          describe "when signing in again" do
            before do
              visit signin_path
              fill_in "Email",        with: employee.email
              fill_in "Password",     with: employee.password
              click_button "Sign in"
            end

            it "should render the default (profile/show) page" do
              page.should have_selector('title', text: employee.emp_full_name)
            end
          end
        end
      end
    end
  end

  describe "visiting employee index" do
    before { visit employees_path }
    it { should have_selector('title', text: 'Sign in') }
  end
end