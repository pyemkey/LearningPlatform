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
#

require 'spec_helper'

describe User do
  
  describe 'demographic fields' do
    before(:each) do
      @michal = FactoryGirl.create(:user)
                  
      end
   

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
end
