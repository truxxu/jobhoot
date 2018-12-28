class UserLanguage < ApplicationRecord
  belongs_to :user_profile
  belongs_to :language

  validates :proficiency, presence: true,
                          numericality: { only_integer: true,
                                          greater_than: 0,
                                          less_than_or_equal_to: 100 }
end
