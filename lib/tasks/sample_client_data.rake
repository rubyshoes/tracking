namespace :db do
  desc "Fill database with sample Client data"
    task :populate_client => :environment do
      require 'faker'
      # Rake::Task['db:reset'].invoke

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

    Client.create!(name:                          "Esme J Inneed", 
                     f_name:                      "Esme",
                     mi:                          "J",
                     l_name:                      "Inneed",
                     birth_date:                  "1987-04-16",
                     address1:                    "62 Southy View",
                     city:                        "Fromm",
                     zip_code:                    "54806",
                     state:                       "WI",
                     medicare_num:                "3008769788",
                     medicaid_num:                "7658945674",
                     member_num:                  "13456666-1", 
                     soc_sec_care_mgr:            "Caring Manager",
                     sscm_ph:                     "1-444-444-4444",
                     nurse_care_mgr:              "Caring Nurse",
                     ncm_ph:                      "1-555-555-5555",
                     emer_contact:                "Always Here",
                     ec_ph:                       "1-666-666-6666",
                     pri_care_phy:                "The One",
                     pcp_ph:                      "1-777-777-7777")

    11.times do |n|
      name = Faker::Name.name
      f_name = Faker::Name.name
      mi = ("A".."Z").to_a[rand(26)]
      l_name = Faker::Name.name
      birth_date = randomDate(:year_range => 60, :year_latest => 22)
      address1 = "Seaview-#{n+5}Way"
      city = Faker::Lorem.words(1).to_s.capitalize
      state = Faker::Address.state()
      zip_code = Faker::Address.zip_code
      medicare_num = rand(10000)
      medicaid_num = rand(20000)
      member_num = 1345 + rand(6666-1)
      soc_sec_care_mgr = Faker::Name.name
      sscm_ph = Faker::PhoneNumber.phone_number
      nurse_care_mgr = Faker::Name.name
      ncm_ph = Faker::PhoneNumber.phone_number
      emer_contact = Faker::Name.name
      ec_ph = Faker::PhoneNumber.phone_number
      pri_care_phy = Faker::Name.name
      pcp_ph = Faker::PhoneNumber.phone_number
      Client.create!(f_name: name, mi: mi, l_name: name, name: name, 
                       birth_date: birth_date, address1: address1,
                       city: city, state: state, zip_code: zip_code, 
                       medicare_num: medicare_num, medicaid_num: medicaid_num,
                       member_num: member_num, soc_sec_care_mgr: name, 
                       sscm_ph: sscm_ph, nurse_care_mgr: name, ncm_ph: ncm_ph, 
                       emer_contact: name, ec_ph: ec_ph, pri_care_phy: name,
                       pcp_ph: pcp_ph)
    end
  end
end