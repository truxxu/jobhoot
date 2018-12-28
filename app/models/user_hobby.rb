class UserHobby < ApplicationRecord
  belongs_to :user_profile
  belongs_to :hobby
end
