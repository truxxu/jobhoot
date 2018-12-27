class UserLanguage < ApplicationRecord
  belongs_to :user_profile
  belongs_to :language
end
