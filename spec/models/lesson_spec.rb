# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Lesson do
  before(:each) { @lesson = create(:lesson) }
  context 'status' do
    it "complete" do
      user = create(:user)
      @lesson.mark_as_completed(user)
      expect(@lesson.users.length).to eq(1)
    end

    it "uncomplete" do
      user = create(:user)
      @lesson.mark_as_completed(user)
      @lesson.mark_as_uncompleted(user)
      expect(@lesson.users.length).to eq(0)   
    end
  end
end
