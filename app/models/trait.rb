class Trait < ApplicationRecord
  has_many :user_traits

  validates :name, presence: true
  validates :description, presence: true
end
