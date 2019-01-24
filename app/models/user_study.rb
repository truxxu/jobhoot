class UserStudy < ApplicationRecord
  belongs_to :user_profile
  belongs_to :study

  STUDY_STATUS =  ["In Progress", "Completed"]
  STUDY_TYPE =    ["Year 9", "Year 10", "Year 11", "Year 12", "Certificate I",
                   "Certificate II", "Certificate III", "Certificate IV",
                   "Trainee", "Diploma", "Advanced Diploma", "Associate Degree",
                   "Bachelor", "Honours", "Graduate Certificate",
                   "Graduate Diploma", "Master", "Doctor", "Other"]

  validates :status, presence: true, inclusion: { in: STUDY_STATUS }
  validates :study_type, presence: true, inclusion: { in: STUDY_TYPE }
  validates :start_date, presence: true
  validates :end_date, presence: true

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
