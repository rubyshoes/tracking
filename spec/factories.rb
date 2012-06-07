# By using the symbol ':employee', we get Factory Girl to simulate the
# Employee model.

FactoryGirl.define do
  factory :employee do
    sequence(:first_name)               { |n| "Elise #{n}" }
    sequence(:last_name)                { |n| "White #{n}" }
    sequence(:mi)                       { |n| "F #{n}" }
    marital_status                        "Single"
    gender                                "Female"
    birth_date                            '1985-01-01'
    hire_date                             '2002-01-01'
    term_date                             ""
    primary_position                      "Support"
    trained_position                      "Household"
    role				                  "Staff"
    sequence(:email)                    { |n| "lname_#{n}@example.com" }
    active                                "true"
    sequence(:address1)                 { |n| "3rd Street #{n}" }
    address2                              ""
    city                                  "Frave"
    zip_code                              "54806"
    state                                 "WI"
    emp_home_ph                           "1-111-111-1111"
    emp_mobile_ph                         "1-222-222-2222"
    sequence(:emer_contact_first_name)  { |n| "EmerFirst #{n}" }
    sequence(:emer_contact_last_name)   { |n| "EmerLast #{n}" }
    emer_contact_relationship             "Other"
    emer_contact_ph                       "1-333-333-333"
    password                              "foobar"
    password_confirmation                 "foobar"

    factory :admin do
      admin true
    end
  end
end
