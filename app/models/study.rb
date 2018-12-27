class Study < ApplicationRecord
  has_many :user_studies

  validates :name, presence: true
end
