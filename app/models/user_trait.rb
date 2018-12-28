class UserTrait < ApplicationRecord
  belongs_to :user_profile
  belongs_to :trait
end
