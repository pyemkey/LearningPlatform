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
  has_many :lesson_completions
  has_many :users, through: :lesson_completions

  def mark_as_completed(user)
    self.lesson_completions.where(user: user).first.update(finished_at: true)
    # binding.pry
  end

  def mark_as_uncompleted(user)
    #binding.pry
    self.lesson_completions.where(user: user).first.update(finished_at: nil)
  end

  def mark_as_started(user)
    self.users << user
  end

  def completed?(user, status=true)
    !self.lesson_completions.where(user: user, finished_at: status).empty?
  end

  def started?(user)
    self.users.include? user
  end

  def label(user)
    "Mark as #{self.completed?(user) ? 'uncompleted' : 'completed'}"
  end

  def status(user)
    if self.completed?(user)
      "Finised"
    elsif self.completed?(user, nil)
      "In progress"
    else
      "Not started"
    end
  end

  def marked(student)
    if !self.started?(student)
      self.mark_as_started(student)
    elsif self.completed?(student)
      self.mark_as_uncompleted(student)
    else
      self.mark_as_completed(student)
    end
  end

end
