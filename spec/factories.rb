# By using the symbol ':employee', we get Factory Girl to simulate the
# Employee model.

FactoryGirl.define do
  factory :employee do
    sequence(:first_name)                 { |n| "First #{n}" }
    sequence(:last_name)                  { |n| "Last #{n}" }
    mi                                    "L"
    marital_status                        "Married"
    gender                                "Male"
    birth_date                            '1985-01-01'
    hire_date                             '2002-01-01'
    term_date                             ""
    primary_position                      "Job Developer"
    trained_position                      "Job Coach"
    role				                          "Staff"
    sequence(:email)                      { |n| "flast_#{n}@example.com" }
    active                                "true"
    address1                              "3rd Ave West"
    address2                              ""
    city                                  "Frave"
    zip_code                              "54806"
    state                                 "WI"
    emp_home_ph                           "1-111-111-1111"
    emp_mobile_ph                         "1-222-222-2222"
    sequence(:emer_contact_first_name)    { |n| "EmerFirst #{n}" }
    sequence(:emer_contact_last_name)     { |n| "ContactLast #{n}" }
    emer_contact_relationship             "Spouse"
    emer_contact_ph                       "1-333-333-333"
    password                              "foobar"
    password_confirmation                 "foobar"

    factory :admin do
      admin true
    end
  end
end
