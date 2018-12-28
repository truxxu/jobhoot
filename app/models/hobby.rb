class Hobby < ApplicationRecord
  has_many :user_hobbies

  validates :name, presence: true
  validates :category, presence: true
end
