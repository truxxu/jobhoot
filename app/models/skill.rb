class Skill < ApplicationRecord
  has_many :user_skills
  has_many :user_experiences

  validates :name, presence: true
end
