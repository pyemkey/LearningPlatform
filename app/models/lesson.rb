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

class Lesson < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :users

  def mark_as_completed(user)
    self.users << user
  end

  def mark_as_uncompleted(user)
    self.users.destroy(user)
  end

  def isCompleted?(user)
    self.users.include? user
  end
end
