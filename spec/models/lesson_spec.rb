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
    before(:each) { @user = create(:user) }
    it "in progress" do
      @lesson.mark_as_started(@user)
      expect(@lesson.users.length).to eq(1)
    end
    it "complete" do
      @lesson.mark_as_completed(@user)
      finished_lesson = @lesson.lesson_completions.where(user: @user, finished_at: true)
      expect(finished_lesson.length).to eq(1)
    end

    it "uncomplete" do
      @lesson.mark_as_completed(@user)
      @lesson.mark_as_uncompleted(@user)
      expect(@lesson.users.length).to eq(0)
    end
  end
end
