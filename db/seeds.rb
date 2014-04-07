# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'faker'

open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|

    countries.read.each_line do |country|
      code, name = country.chomp.split('|')
      Country.create!(name: name, code: code)
    end
end

admin = User.create(email: "michal#example.com", password: "test1234", name: Faker::Name.name)

10.times do 
  user = User.create(email: Faker::Internet.email, password: "test1234", name: Faker::Internet.user_name)
  
end