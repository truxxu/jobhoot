class UserHobby < ApplicationRecord
  belongs_to :user_profile

  CATEGORY = ["Collecting", "Making and Tinkering", "Outdoor Recreation",
              "Gardening", "Liberal Arts Pursuits", "Sports and Games",
              "Indoor Recreation", "Other"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
