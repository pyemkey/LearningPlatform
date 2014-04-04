require 'spec_helper'

describe City do

  describe "name" do

    before(:each) do
      @london = FactoryGirl.create(:city)
    end

    context 'is provided' do
      it 'create new city' do
        mediolan = City.new(name: "Mediolan")
        expect(mediolan).to be_valid
      end    
    end

    context 'is empty' do
      it "is invalid without name" do
        rome = City.new()
        expect(rome).to have(1).errors_on(:name)
      end
    end

    context 'have to be unique' do
      it 'is unique' do
        mediolan = City.new(name: "Mediolan")
        expect(mediolan).to be_valid
      end

      it 'is not unique' do
        new_london = City.new(name: "London")
        expect(new_london).to have(1).errors_on(:name)
      end
    end
  end
end