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

class CourseLearner < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
  belongs_to :course, class_name: "Course"
end
