def full_title(page_title)
  base_title = "Time and it's Cost"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

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

def sign_in(employee)
  visit signin_path
  fill_in "Email",        with: employee.email
  fill_in "Password",     with: employee.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = employee.remember_token
end
