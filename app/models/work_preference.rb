class WorkPreference < ApplicationRecord
  belongs_to :user_profile
  belongs_to :position

  validates :objectives, length: { maximum: 500 }
end
