namespace :db do
  desc "Fill database with sample Employee data"
  task :populate => :environment do
    require 'faker'

    @gender = ["Male", "Female"]
    @role = ["Staff", "Support", "Team_Leader", "Manager", "Director"]
    @marital_status = ["Single", "Married"]
    @primary_position = ["Household", "Job Developer", "Job Coach", 
                         "Job Support", "Personal Care"]
    @trained_position = ["Household", "Job Developer", "Job Coach", 
                         "Job Support", "Personal Care"]
    @emer_contact_relationship = ["Friend", "Brother", "Sister", "Aunt", 
                                  "Uncle", "Cousin", "Nephew", "Father",
                                  "Mother", "Spouse"]

    [{first_name:                  "Shelly",
                     last_name:                   "Houghton",
                     mi:                          "M",
                     full_name:                   "Shelly M Houghton",
                     marital_status:              "Single",                  
                     gender:                      "Female",
                     hire_date:                   "2000-04-16",
                     primary_position:            "Manager",
                     trained_position:            "Job Developer",
                     email:                       "shoughton@example.com",
                     active:                      true,
                     address1:                    "76th Ave",
                     city:                        "Frave",
                     zip_code:                    "54806",
                     state:                       "WI",
                     emp_home_ph:                 "1-111-111-1111",
                     emp_mobile_ph:               "1-222-222-2222",
                     emer_contact_first_name:     "Kenneth",
                     emer_contact_last_name:      "Koening",
                     emer_contact_relationship:   "Friend",
                     emer_contact_ph:             "1-333-333-3333",
                     role:                        "Manager",
                     birth_date:                  "1982-08-21",
                     admin:                       true,
                     password:                    "90nothguoh",
                     password_confirmation:       "90nothguoh"},

    {first_name:                  "James",
                     last_name:                   "Scott",
                     full_name:                   "James Scott Jr",
                     marital_status:              "Married",
                     gender:                      "Male",
                     hire_date:                   "2000-04-16",
                     primary_position:            "Manager",
                     trained_position:            "Job Developer",
                     email:                       "skoona@gmail.com",
                     active:                      true,
                     address1:                    "1111 AnyStreet",
                     city:                        "AnyCity",
                     zip_code:                    "46801",
                     state:                       "IN",
                     emp_home_ph:                 "1-260-999-9999",
                     emp_mobile_ph:               "1-260-999-9999",
                     emer_contact_first_name:     "Judy",
                     emer_contact_last_name:      "Spouse",
                     emer_contact_relationship:   "Spouse",
                     emer_contact_ph:             "1-260-999-9999",
                     role:                        "Manager",
                     birth_date:                  "1982-08-21",
                     admin:                       true,
                     password:                    "developer99",
                     password_confirmation:       "developer99"}].each {|item| Employee.create!(item) }


    99.times do |n|
      first_name = Faker::Name.name
      last_name = Fake::Name.name
      mi = ("A".."Z").to_a[rand(26)]
      full_name = Faker::Name.name
      marital_status = @marital_status[rand(2)].to_s
      gender = @gender[rand(2)].to_s
      hire_date = randomDate(:year_range => 60, :year_latest => 12)
      birth_date = randomDate(:year_range => 60, :year_latest => 22)
      primary_position = @primary_position[rand(5)].to_s
      trained_position = @trained_position[rand(5)].to_s
      email = "emp-#{n+1}@example.org"
      active = [true, false][rand(2)]
      admin = (1 == rand(2) ? true : false)
      role = @role[rand(5)].to_s
      address1 = "Seaview-#{n+5}Way"
      city = Faker::Lorem.words(1).to_s.capitalize
      state = Faker::Address.us_state()
      zip_code = Faker::Address.zip_code
      emp_home_ph = Faker::PhoneNumber.phone_number
      emp_mobile_ph = Faker::PhoneNumber.phone_number
      emer_contact_first_name = Faker::Name.name
      emer_contact_last_name = Faker::Name.name
      emer_contact_relationship = @emer_contact_relationship[rand(10)].to_s
      emer_contact_ph = Faker::PhoneNumber.phone_number
      password = "uniqueone"
      password_confirmation = "uniqueone"
      Employee.create!(first_name: name, mi: mi, last_name: name,
                       full_name: name, marital_status: marital_status,
                       gender: gender, birth_date: birth_date, hire_date: hire_date,
                       primary_position: primary_position, trained_position: 
                       trained_position, email: email, role: role, address1:
                       address1, city: city, state: state, zip_code: zip_code, 
                       emp_home_ph: emp_home_ph, emp_mobile_ph: emp_mobile_ph,
                       emer_contact_first_name: emer_contact_first_name, 
                       emer_contact_last_name: emer_contact_last_name, 
                       emer_contact_relationship: emer_contact_relationship,
                       emer_contact_ph: emer_contact_ph, password: password, 
                       password_confirmation: password_confirmation, active: 
                       active, admin: admin)
    end
  end

  def randomDate(params={})
    years_back = params[:year_range] || 5
    latest_year = params[:year_latest]  || 0
    year = (rand * (years_back)).ceil +
        (Time.now.year - latest_year - years_back)
    month = (rand * 12).ceil
    day = (rand * 31).ceil
    series = [date = Time.local(year, month, day)]
    if params[:series]
      params[:series].each do |some_time_after|
        series << series.last + (rand * some_time_after).ceil
      end
      return series
    end
    date
  end

end