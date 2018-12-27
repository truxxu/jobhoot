class UserStudy < ApplicationRecord
  belongs_to :user_profile
  belongs_to :study
end
