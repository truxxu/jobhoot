class UserExperience < ApplicationRecord
  belongs_to :user_profile
  belongs_to :skill
  belongs_to :position
end
