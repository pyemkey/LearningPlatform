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

admin = User.create(email: "michal#example.com", password: "test1234", name: Faker::Name.name, city: City.find_or_create_by_name("Warszawa"), state: State.find_or_create_by_name("Mazowieckie"), country: Country.find_by_name("Poland"), gender: "male")
gender = ["female", "male"]

5.times do 
  user = User.create(
                email: Faker::Internet.email, 
                password: "test1234", 
                name: Faker::Internet.user_name, 
                city: City.find_or_create_by_name("Warszawa"), 
                state: State.find_or_create_by_name("Mazowieckie"), 
                country: Country.find_by_name("Poland"),
                gender: gender.sample)

  course = Course.create(title: Faker::Commerce.product_name,
                description: Faker::Company.catch_phrase,
                author: user)
    
  end

rand(1..4).times do
  course = Course.find(rand(1..4))

  rand(1..10).times do
    lesson = Lesson.create(
              title: Faker::Company.catch_phrase,
              body: Faker::Lorem.paragraphs(rand(2..8)).join('\n'))
    course.lessons << lesson
  end

  
  rand(0..2).times do
    user = User.create(
              email: Faker::Internet.email, 
              password: "test1234", 
              name: Faker::Internet.user_name, 
              city: City.find_or_create_by_name("Warszawa"), 
              state: State.find_or_create_by_name("Mazowieckie"), 
              country: Country.find_by_name("Poland"),
              gender: gender.sample)

    course.learners << user
  end
end
