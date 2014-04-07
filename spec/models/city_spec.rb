# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state_id   :integer
#  country_id :integer
#

require 'spec_helper'

describe City do

  describe "name" do

    before(:each) do
      @london = create(:city)
    end

    context 'is provided' do
      it 'create new city' do
        mediolan = build(:city, name: "Mediolan")
        expect(mediolan).to be_valid
      end    
    end

    context 'is empty' do
      it "is invalid without name" do
        rome = build(:city, name: nil)
        expect(rome).to have(1).errors_on(:name)
      end
    end

    context 'have to be unique' do
      it 'is unique' do
        mediolan = build(:city, name: "Mediolan")
        expect(mediolan).to be_valid
      end

      it 'is not unique' do
        new_london = build(:city, name: "London")
        expect(new_london).to have(1).errors_on(:name)
      end
    end 
  end
end
