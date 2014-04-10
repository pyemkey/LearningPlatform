# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  author_id    :integer
#  editor_id    :integer
#

class Course < ActiveRecord::Base
  has_many :lessons
  belongs_to :author, class_name: "User"
  has_many :course_learners
  has_many :learners, through: :course_learners

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
end
