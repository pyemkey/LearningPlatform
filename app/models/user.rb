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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  GENDER_TYPE = %w(male female)


  has_and_belongs_to_many :lessons
  has_many :course_learners, foreign_key: "learner_id"
  has_many :authored_courses, foreign_key: "author_id", class_name: "Course"
  has_many :courses, through: :course_learners
  belongs_to :city
  belongs_to :state
  belongs_to :country

  accepts_nested_attributes_for :city, reject_if: :check_existence_of_city
  accepts_nested_attributes_for :state, reject_if: :check_existence_of_state
  accepts_nested_attributes_for :country, reject_if: :check_existence_of_country


  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :gender, inclusion: { in: GENDER_TYPE }, presence: true
  
  def check_progress(course)
    "#{((self.lessons.where(course: course).count * 100)/course.lessons.count.to_f).round}%"
  end
  
private

  def check_existence_of_city(attributes)
    existing_city = find_existing(City, attributes)
    self.city = existing_city unless existing_city.nil?
  end

  def check_existence_of_state(attributes)
    existing_state = find_existing(State, attributes)
    self.state = existing_state unless existing_state.nil?
  end

  def check_existence_of_country(attributes)
    existing_country = find_existing(Country, attributes)
    self.country = existing_country unless existing_country.nil?
  end

  def find_existing(obj, attributes)
    obj.find_by(name: attributes[:name].capitalize)
  end
end
