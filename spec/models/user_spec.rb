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
    @michal = create(:user)               
  end
   
  describe 'demographic fields' do
    

    context 'demographic fields are correct' do
      it 'confirm that demographic fields are filled in properly' do
        expect(@michal.demographic_options_empty?).to_not be_true
      end
    end

    context 'demographic fields are incorrect' do
      it 'return true if some of demographic fields is null' do
        @michal.city = nil
        @michal.state = nil
        @michal.country = nil
        expect(@michal.demographic_options_empty?).to be_true
      end

      it 'confirm that City is empty' do
        @michal.city = nil
        expect(@michal.city).to be_nil
      end

      it 'confirm that State is empty' do
        @michal.state = nil
        expect(@michal.state).to be_nil
      end

      it 'confirm that Country is empty' do
        @michal.country = nil
        expect(@michal.country).to be_nil
      end
    end
  end

  describe "have courses" do
    context 'is an author' do
      it "of one course" do
        @michal.authored_courses << create(:course)
        expect(@michal.authored_courses.count).to eq(1)
      end

      it "of two courses" do
        2.times { @michal.authored_courses << create(:course) }
        
        expect(@michal.authored_courses.count).to eq(2)
      end 
    end

    context 'is a participant' do
      it "of one course" do
        @michal.courses << create(:course)
        expect( @michal.courses.count).to eq(1)
      end
      it "of two courses" do 
        2.times { @michal.courses << create(:course) }
        expect( @michal.courses.count).to eq(2)
      end
    end
  end
end
