class LessonCompletion < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  scope :finished, -> { where(finished_at: true) }
end