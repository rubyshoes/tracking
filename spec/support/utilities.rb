include ApplicationHelper

def valid_signin(employee)
  fill_in "Email",       with: employee.email
  fill_in "Password",    with: employee.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.flash.error', text: message)
  end
end

Rspec::Matchers.define :be_accessible do |attribute|
  match do |response|
    response.class.accessible_attributes.include?(attribute)
  end
  description { "be accessible :#{attribute}" }
  failure_message_for_should { ":#{attribute} should be accessible" }
  failure_message_for_should_not{ ":#{attribute} should not be accessible" }
end

def sign_in(employee)
  visit signin_path
  fill_in "Email",        with: employee.email
  fill_in "Password",     with: employee.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = employee.remember_token
end

def valid_signin(admin)
  fill_in "Email",       with: admin.email
  fill_in "Password",    with: admin.password
  click_button "Sign in"
end
