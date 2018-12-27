class OtherStudy < ApplicationRecord
  has_many :user_other_studies

  validates :title, presence: true
end
