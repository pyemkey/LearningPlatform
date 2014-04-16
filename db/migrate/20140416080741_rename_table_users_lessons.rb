class RenameTableUsersLessons < ActiveRecord::Migration
  def change
    rename_table('lessons_users','lesson_completions')
  end
end
