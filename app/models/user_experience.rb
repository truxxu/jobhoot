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

  def check_date?
    start_date < end_date
  end

  def duration
    delta = self.end_date.to_i - self.start_date.to_i
    if delta < 2_629_800
      return "#{delta / 86_400} day(s)"
    elsif delta < 31_557_600
      return "#{delta / 2_529_800} month(s)"
    elsif delta > 31_557_600
      return "#{delta / 31_557_600} year(s)"
    end
  end
end
