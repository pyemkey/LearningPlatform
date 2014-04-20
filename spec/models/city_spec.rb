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
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
