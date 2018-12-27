class WorkPreference < ApplicationRecord
  belongs_to :user_profile
  belongs_to :position
end
