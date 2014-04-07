class CreateCourseLearners < ActiveRecord::Migration
  def change
    create_table :course_learners do |t|
      t.belongs_to :learner, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
