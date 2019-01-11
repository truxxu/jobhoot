class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :user_studies, dependent: :destroy
  has_many :studies, through: :user_studies
  has_many :user_other_studies, dependent: :destroy
  has_many :other_studies, through: :user_other_studies
  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages
  has_many :work_preferences, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :user_experiences, dependent: :destroy
  # has_many :positions, through: :user_experiences
  has_many :user_traits, dependent: :destroy
  has_many :traits, through: :user_traits
  has_many :user_hobbies

  VISA = ["Australian Resident", "Student Visa", "Working Holiday Visa"]

  validates :name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { in: %w(Male Female Other) }
  validates :phone, presence: true, numericality: { only_integer: true }
  validates :residency_status, presence: true
  validates :residency_status, inclusion: { in: VISA }
  validates :origin_country, presence: true
  validates :residence_country, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
