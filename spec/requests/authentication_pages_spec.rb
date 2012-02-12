require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do

    before { visit signin_path }

    it { should have_selector('h2',     text: 'Sign In') }
    it { should have_selector('title',  text: 'Sign In') }

    describe "with invalid information" do

      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign In') }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.flash.error', text: 'Invalid') }
      end
    end

    describe "with valid information" do
      let(:employee) { FactoryGirl.create(:employee) }
      before { valid_signin(employee) }

      it { should have_selector('title',    text: "Employee") }
      it { should have_link('Profile',      href: employee_path(employee)) }
      it { should have_link('Sign out',     href: signout_path) }
      it { should_not have_link('Sign in',  href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end
end
