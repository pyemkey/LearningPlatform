class AddPkToLessonsUsers < ActiveRecord::Migration
  def change
    add_column :lessons_users, :id, :primary_key
  end
end
