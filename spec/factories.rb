# By using the symbol ':employee', we get Factory Girl to simulate the
# Employee model.
Factory.define :employee do |employee|
  employee.first_name                       "Rodger"
  employee.last_name                        "Dodger"
  employee.mi                               "L"
  employee.marital_status                   "Married"
  employee.gender                           "Male"
  employee.birth_date                       '1995-03-01'
  employee.hire_date                        '200-01-01'
  employee.term_date                        ""
  employee.primary_position                 "Job Developer"
  employee.trained_position                 "Job Coach"
  employee.email                            "rdodger@example.com"
  employee.active                           "true"
  employee.address1                         "3rd Ave West"
  employee.address2                         ""
  employee.city                             "Frave"
  employee.zip_code                         "54806"
  employee.state                            "WI"
  employee.emp_home_ph                      "1-111-111-1111"
  employee.emp_mobile_ph                    "2-222-222-2222"
  employee.emer_contact_first_name          "Alcie"
  employee.emer_contact_last_name           "Dodger"
  employee.emer_contact_relationship        "Spouse"
  employee.emer_contact_ph                  "3-333-333-333"
  employee.password                         "foobar"
  employee.password_confirmation            "foobar"
end
