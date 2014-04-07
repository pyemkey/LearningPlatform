# == Schema Information
#
# Table name: course_learners
#
#  id         :integer          not null, primary key
#  learner_id :integer
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_learner do
    learner nil
    course nil
  end
end
