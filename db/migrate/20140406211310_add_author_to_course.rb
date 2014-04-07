class AddAuthorToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :editor_id, index: true
  end
end
