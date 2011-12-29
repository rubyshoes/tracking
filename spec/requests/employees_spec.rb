require 'spec_helper'

describe "Employees" do

  describe "newemployee" do

    describe "failure" do

      it "should not make a new employee" do
        lambda do
          visit newemployee_path
          fill_in "first_name",                :with => ""
          fill_in "mi",                        :with => ""
          fill_in "last_name",                 :with => ""
          fill_in "marital_status",            :with => ""
          fill_in "gender",                    :with => ""
          fill_in "birth_date",                :with => ""
          fill_in "hire_date",                 :with => ""
          fill_in "term_date",                 :with => ""
          fill_in "primary_position",          :with => ""
          fill_in "trained_position",          :with => ""
          fill_in "email",                     :with => ""
          fill_in "address1",                  :with => ""
          fill_in "address2",                  :with => ""
          fill_in "active",                    :with => ""
          fill_in "city",                      :with => ""
          fill_in "zip_code",                  :with => ""
          fill_in "state",                     :with => ""
          fill_in "emp_home_ph",               :with => ""
          fill_in "emp_mobile_ph",             :with => ""
          fill_in "emer_contact_first_name",   :with => ""
          fill_in "emer_contact_last_name",    :with => ""
          fill_in "emer_contact_relationship", :with => ""
          fill_in "emer_contact_ph",           :with => ""
          fill_in "role",                      :with => ""
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
          fill_in "first_name",                :with => "Sandra"
          fill_in "mi",                        :with => "M"
          fill_in "last_name",                 :with => "Maxell"
          fill_in "marital_status",            :with => "Married"
          fill_in "gender",                    :with => "Female"
          fill_in "birth_date",                :with => "1978-12-11"
          fill_in "hire_date",                 :with => "1983-01-01"
          fill_in "term_date",                 :with => "2009-12-12"
          fill_in "primary_position",          :with => "Job Coach"
          fill_in "trained_position",          :with => "Job Developer"
          fill_in "email",                     :with => "smaxell@example.com"
          fill_in "address1",                  :with => "43rd Drudge Rd."
          fill_in "address2",                  :with => "Birk View"
          fill_in "active",                    :with => "true"
          fill_in "city",                      :with => "Frave"
          fill_in "zip_code",                  :with => "54806"
          fill_in "state",                     :with => "WI"
          fill_in "emp_home_ph",               :with => "1-111-111-1111"
          fill_in "emp_mobile_ph",             :with => "1-222-222-2222"
          fill_in "emer_contact_first_name",   :with => "Hank"
          fill_in "emer_contact_last_name",    :with => "Maxell"
          fill_in "emer_contact_relationship", :with => "Spouse"
          fill_in "emer_contact_ph",           :with => "1-333-333-3333"
          fill_in "role",                      :with => "Staff"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "New Employee has been saved")
          response.should render_template('employees/show')
          response.should change(Employee, :count).by(1)
        end
      end
    end
  end
end
