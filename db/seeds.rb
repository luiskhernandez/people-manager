# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genders = ['famale', 'male']
100.times do
   Person.create(
             first_name:  Faker::Name.first_name,
             last_name:   Faker::Name.last_name,
             email:       Faker::Internet.safe_email,
             bio:         Faker::Lorem.sentence(40),
             gender:      genders.sample,
             birthdate:   Faker::Date.backward((10..50).to_a.sample * 365),
             job:         Faker::Company.profession)
end
