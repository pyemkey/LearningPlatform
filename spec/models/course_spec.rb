# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  author_id   :integer
#

require 'spec_helper'

describe Course do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:author) }
  it { should ensure_length_of(:title).is_at_least(5).is_at_most(30) }
  it { should ensure_length_of(:description).is_at_least(20).is_at_most(180) }

  before(:each) { @course = create(:course)}

  context 'have students' do
    it "is one student" do
      user = create(:user)
      user.courses << @course
      expect(@course.learners.length).to eq(1)
    end

    it "is two students" do
      2.times do
        user = create(:user)
        @course.learners << user
      end
      expect(@course.learners.length).to eq(2)
    end

    it "none" do
     expect(@course.learners.length).to eq(0)
   end
  end

  context "enrolled by" do
    before(:each) { @user = create(:user)}
    it "student" do
      @course.learners << @user
      expect(@course.enrolled?(@user)).to be_true
    end
    it "nobody"
  end
end
