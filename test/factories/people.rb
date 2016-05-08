FactoryGirl.define do
  factory :person do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    sequence(:email)  { |n| "email#{n}@people_manager.com" }
    bio               { Faker::Lorem.sentence(3) }
    gender            { Person::GENDERS.sample }
    birthdate         { Faker::Date.backward(2555) }
    job               { Faker::Company.profession }
  end
end
