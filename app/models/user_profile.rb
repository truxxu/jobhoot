class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :user_studies
  has_many :user_other_studies
  has_many :user_languages
  has_many :work_preferences
  has_many :user_experiences
  has_many :user_skills
  has_many :user_traits
  has_many :user_hobbies
end
