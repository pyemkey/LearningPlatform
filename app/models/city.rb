class City < ActiveRecord::Base
  has_many :users
  belongs_to :state
  belongs_to :country
end
