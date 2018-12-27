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

  VISA =      ["Australian Resident", "Student Visa", "Working Holiday Visa"]
  CONTRACT =  ["Casual", "Contractor", "Full Time", "Internship", "Part Time",
               "Volunteer", "Work Experience"]

  validates :name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { in: %w(Male Female Other) }
  validates :phone, presence: true, numericality: { only_integer: true }
  validates :residency_status, presence: true, inclusion: { in: VISA }
  validates :contract_type, presence: true, inclusion: { in: CONTRACT }
end
