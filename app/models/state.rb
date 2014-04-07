# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  country_id :integer
#

class State < ActiveRecord::Base
  has_many :cities
  has_many :users
  belongs_to :country
end
