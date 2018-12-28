require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.new(user_id: @user.id, name: "Daniel", last_name:
      "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone: 123456,
      residency_status: "Australian Resident", contract_type: "Casual")
  end

  SEX = ["Male", "Female", "Other"]

  test "should be valid" do
    assert @user_profile.valid?, @user_profile.errors.full_messages
  end

  test "name should be present" do
    @user_profile.name = ""
    assert_not @user_profile.valid?, @user_profile.errors.full_messages
  end

  test "last_name should be present" do
    @user_profile.last_name = ""
    assert_not @user_profile.valid?, @user_profile.errors.full_messages
  end

  test "sex should be present" do
    @user_profile.sex = ""
    assert_not @user_profile.valid?, @user_profile.errors.full_messages
  end

  test "sex should be included" do
    assert_includes SEX, @user_profile.sex, @user_profile.errors.full_messages
  end

  test "phone should be included" do
    @user_profile.phone = ""
    assert_not @user_profile.valid?, @user_profile.errors.full_messages
  end

  test "phone should be an integer" do
    assert_match "/\A[+-]?\d+\z/", @user_profile.phone.to_s, @user_profile.errors.full_messages
  end
end
