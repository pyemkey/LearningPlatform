class RemoveEditorFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :editor_id
  end
end
