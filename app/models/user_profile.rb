class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :user_studies, dependent: :destroy
  has_many :user_other_studies, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :work_preferences, dependent: :destroy
  has_many :user_experiences, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :user_traits, dependent: :destroy
  has_many :user_hobbies, dependent: :destroy

  VISA =      ["Australian Resident", "Student Visa", "Working Holiday Visa"]
  CONTRACT =  ["Casual", "Contractor", "Full Time", "Internship", "Part Time",
               "Volunteer", "Work Experience"]

  validates :name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { in: %w(Male Female Other) }
  validates :phone, presence: true, numericality: { only_integer: true }
  # validates :residency_status, presence: true
  validates :residency_status, inclusion: { in: VISA }
  # validates :contract_type, presence: true
  validates :contract_type, inclusion: { in: CONTRACT }
end
