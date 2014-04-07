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

class City < ActiveRecord::Base
  has_many :users
  belongs_to :state
  belongs_to :country

  validates :name, presence: true, uniqueness: true

  def name=(new_name)
    self[:name] = new_name.try(:capitalize)
  end
end
