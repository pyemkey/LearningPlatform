# == Schema Information
#
# Table name: lesson_completions
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  lesson_id   :integer          not null
#  finished_at :boolean
#

class LessonCompletion < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  scope :finished, -> { where(finished_at: true) }
end
