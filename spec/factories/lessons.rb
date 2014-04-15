# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    association :course
    title {Faker::Lorem.characters(5)}
    body {Faker::Lorem.sentence}
  end
end
