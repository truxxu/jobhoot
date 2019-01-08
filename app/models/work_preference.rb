class WorkPreference < ApplicationRecord
  belongs_to :user_profile
  belongs_to :position

  CONTRACT = ["Casual", "Contractor", "Full Time", "Internship", "Part Time",
              "Volunteer", "Work Experience"]

  validates :objectives, length: { maximum: 500 }
  validates :contract_type, presence: true
  validates :contract_type, inclusion: { in: CONTRACT }
end
