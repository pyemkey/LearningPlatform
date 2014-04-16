class AddFinishToLessonCompletions < ActiveRecord::Migration
  def change
    add_column :lesson_completions, :finished_at, :boolean
  end
end
