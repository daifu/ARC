FactoryGirl.define do

  factory :address do |factory|
    factory.firstname  { Faker::Name.first_name }
    factory.lastname   { Faker::Name.last_name }
    factory.address1   { Faker::Address.street_address }
    factory.address2   { Faker::Address.secondary_address }
    factory.city_name  { Faker::Address.city }
    factory.zipcode    { Faker::Address.zip_code }
    factory.phone      { Faker::PhoneNumber.phone_number }
    factory.state_name  { Faker::Address.state }
    factory.alternative_phone { Faker::PhoneNumber.phone_number }
  
    # associations: 
    factory.country { 
      FactoryGirl.create(:united_states)
    }
  end

end