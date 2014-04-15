# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  gender                 :string(255)
#  city_id                :integer
#  state_id               :integer
#  country_id             :integer
#  name                   :string(255)
#

require 'spec_helper'

describe User do
  before(:each) do
    @user = create(:user)               
  end

  describe "have courses" do
    context 'is an author' do
      it "of one course" do
        @user.authored_courses << create(:course)
        expect(@user.authored_courses.count).to eq(1)
      end

      it "of two courses" do
        2.times { @user.authored_courses << create(:course) }
        
        expect(@user.authored_courses.count).to eq(2)
      end 
    end

    context 'is a participant' do
      it "of one course" do
        @user.courses << create(:course)
        expect( @user.courses.count).to eq(1)
      end
      it "of two courses" do 
        2.times { @user.courses << create(:course) }
        expect( @user.courses.count).to eq(2)
      end
    end

    context 'course progress' do
      it "is 50%" do
        course = create(:course)
        2.times do
          course.lessons << create(:lesson)
        end
        @user.courses << course
        @user.lessons << course.lessons.first
        expect(@user.check_progress(course)).to eq("50%")
      end
    end
  end
end