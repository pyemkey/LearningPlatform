class State < ActiveRecord::Base
  has_many :cities
  has_many :users
  belongs_to :country
end
