class Study < ApplicationRecord
  has_many :user_studies

  validates :title, presence: true
end
