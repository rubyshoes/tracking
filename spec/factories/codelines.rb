FactoryGirl.define do
  factory :codeline do |f|
    f.contract_id = 1
    f.code_id = 1
    f.client_id = 1
    f.units_alloc = 100.00
  end
end
