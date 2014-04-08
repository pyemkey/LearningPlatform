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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  GENDER_TYPE = %w(male female)


  has_many :course_learners, foreign_key: "learner_id"
  has_many :authored_courses, foreign_key: "author_id", class_name: "Course"
  has_many :courses, through: :course_learners

  belongs_to :city
  belongs_to :state
  belongs_to :country
  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :state
  accepts_nested_attributes_for :country

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :gender, inclusion: { in: GENDER_TYPE }, presence: true

  def autosave_associated_records_for_city
    begin
      new_city = City.find_by_name(self.city.name)
      if new_city
        self.city = new_city
      else
        self.city.save!
      end
    rescue 
      new_city = nil
    end
    
  end

  def autosave_associated_records_for_state
    begin 
      new_state = State.find_by_name(state.name)
      if new_state
        self.state = new_state
      else
        self.state.save!
      end
    rescue
      new_state = nil
    end
  end

  def autosave_associated_records_for_country
    begin 
      new_country = Country.find_by_name(country.name)
      if new_country
        self.country = new_country
      else
        self.country.save!
      end
    rescue
      new_country = nil
    end
  end

  def demographic_options_empty?
    !(city || state || country)
  end
end
