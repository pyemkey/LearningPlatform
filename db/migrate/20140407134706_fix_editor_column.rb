class FixEditorColumn < ActiveRecord::Migration
  def change
    rename_column :courses, :editor_id_id, :editor_id
  end
end
