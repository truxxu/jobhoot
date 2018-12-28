class Position < ApplicationRecord
  has_many :work_preferences
  has_many :user_experiences

  validates :title, presence: true
end
