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
  validates :type, presence: true, inclusion: { in: STUDY_TYPE }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
