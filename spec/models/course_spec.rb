# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  author_id    :integer
#  editor_id_id :integer
#

require 'spec_helper'

describe Course do

  context "presence" do
    it "does not allow save course without title" do
      expect(build(:course, title: nil)).to have(1).errors_on(:title)
    end

    it "does not allow save course without description" do 
      expect(build(:course, description: nil)).to have(1).errors_on(:description)
    end
  end

  context 'have one author' do
    it "is invalid without author" do 
      expect(build(:course, author_id: nil)).to have(1).errors_on(:author_id)
    end
    it "is valid with author" do
      expect(build :course).to be_valid
    end
  end

  context 'students' do
    before(:each) do puts "Total Users:#{User.count}"
    @course = build(:course) end
    it "is one student" do
      user = build(:user)
      user.courses << @course
      expect(@course.learners.length).to eq(1)
    end
    it "is two students"
    it "none"
  end
end
