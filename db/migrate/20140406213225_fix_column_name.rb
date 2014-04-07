class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :courses, :author_id_id, :author_id
  end
end
