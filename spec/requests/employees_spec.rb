require 'spec_helper'

describe "Employees" do

  describe "newemployee" do

    describe "failure" do

      it "should not make a new employee" do
        lambda do
          visit newemployee_path
          fill_in "first_name",             :with =>  ""
          fill_in "last_name",              :with =>  ""
          fill_in "marital_status",         :with =>  ""
          fill_in "gender",                 :with =>  ""
          fill_in "birth_date",             :with =>  ""
          fill_in "hire_date",              :with =>  ""
          fill_in "primary_position",       :with =>  ""
          fill_in "email",                  :with =>  ""
          fill_in "active",                 :with =>  ""
          fill_in "address1",               :with =>  ""
          fill_in "city",                   :with =>  ""
          fill_in "zip_code",               :with =>  ""
          fill_in "state",                  :with =>  ""
          fill_in "password",               :with =>  ""
          fill_in "password_confirmation",  :with =>  ""
          click_button
          response.should render_template('employees/new')
          response.should have_selector("div#error_explanation")
          response.should_not change(Employee, :count)
        end
      end
    end

    describe "success" do

      it "should make a new employee" do
        lambda do
          visit newemployee_path
          fill_in "first_name",             :with =>  "Teress"
          fill_in "last_name",              :with =>  "Pottle"
          fill_in "marital_status",         :with =>  "Single"
          fill_in "gender",                 :with =>  "Female"
          fill_in "birth_date",             :with =>  "1979-09-21"
          fill_in "hire_date",              :with =>  "2002-01-01"
          fill_in "primary_position",       :with =>  "Team Leader"
          fill_in "email",                  :with =>  "tpottle@example.com"
          fill_in "active",                 :with =>  "true"
          fill_in "address1",               :with =>  "1 First Ave"
          fill_in "city",                   :with =>  "Frave"
          fill_in "zip_code",               :with =>  "54806"
          fill_in "state",                  :with =>  "WI"
          fill_in "password",               :with =>  "foobar"
          fill_in "password_confirmation",  :with =>  "foobar"
          click_button
          response.should have_selector("div.flash.success", 
                                        :content => "New Employee was")
          response.should render_template('employees/show')
          response.should change(Employee, :count).by(1)
        end
      end
    end
  end
end

