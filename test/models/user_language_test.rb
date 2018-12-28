require 'test_helper'

class UserLanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @language = Language.create(name: "French")
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.create(user_id: @user.id, name: "Daniel",
      last_name: "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone:
      123456, residency_status: "Australian Resident", contract_type: "Casual")
    @user_language = UserLanguage.new(user_profile_id: @user_profile.id,
      language_id: @language.id, proficiency: 90)
  end

  test "should be valid" do
    assert @user_language.valid?, @user_language.errors.full_messages
  end

  test "proficiency should be an integer" do
    assert_match /\A[+-]?\d+\z/, @user_language.proficiency.to_s,
                                   @user_language.errors.full_messages
  end

  test "proficiency should be between 1 and 100" do
    assert_includes 1..100, @user_language.proficiency,
                            @user_language.errors.full_messages
  end
end
