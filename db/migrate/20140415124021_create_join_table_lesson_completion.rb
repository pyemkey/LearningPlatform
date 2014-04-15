class CreateJoinTableLessonCompletion < ActiveRecord::Migration
  def change
    create_join_table :users, :lessons do |t|
      # t.index [:user_id, :lesson_id]
      # t.index [:lesson_id, :user_id]
    end
end
end
