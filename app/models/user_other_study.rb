class UserOtherStudy < ApplicationRecord
  belongs_to :user_profile
  belongs_to :other_study

  STUDY_TYPE = ["Certification", "License", "Course", "Other"]

  validates :study_type, presence: true, inclusion: { in: STUDY_TYPE }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
