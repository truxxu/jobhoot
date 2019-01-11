class UserExperience < ApplicationRecord
  belongs_to :user_profile
  belongs_to :skill
  belongs_to :study

  EXP_STATUS = ["Currently Working", "Finished"]
  CONTRACT =   ["Casual", "Contractor", "Full Time", "Internship", "Part Time",
                "Volunteer", "Work Experience"]

  validates :company_name, presence: true
  validates :status, presence: true, inclusion: { in: EXP_STATUS }
  validates :contract_type, presence: true, inclusion: { in: CONTRACT }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true, length: { maximum: 500 }
end
