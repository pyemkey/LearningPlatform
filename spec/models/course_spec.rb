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
  before(:each) { @course = create(:course)}
  context "presence" do
    it "does not allow save course without title" do
      expect(build(:course, title: nil).errors_on(:title)).to include("can't be blank")
    end

    it "does not allow save course without description" do 
      expect(build(:course, description: nil).errors_on(:description)).to include("can't be blank")
    end
  end

  describe "title" do
    it "has right length" do
      expect(build(:course, title: "a"*5)).to be_valid
    end

    context "length out of range" do
      it "too short" do
        expect(build(:course, title: "a").errors_on(:title)).to include("is too short (minimum is 5 characters)")
      end

      it "too long" do
        expect(build(:course, title: "a"*31).errors_on(:title)).to include("is too long (maximum is 15 characters)")
      end
    end   
  end

  describe "description" do

    it "has right length" do
      expect(build(:course, description: "a"*20)).to be_valid
    end

    context "length out of range" do
      it "too short" do
        expect(build(:course, description: "a"*19).errors_on(:description)).to include("is too short (minimum is 20 characters)")
      end

      it "too long" do
        expect(build(:course, description: "a"*181).errors_on(:description)).to include("is too long (maximum is 180 characters)")
      end
    end
  end

  context 'have one author' do
    it "is invalid without author" do 
      expect(build(:course, author_id: nil)).to have(1).errors_on(:author)
    end
    it "is valid with author" do
      expect(build :course).to be_valid
    end
  end

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
