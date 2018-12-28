require 'test_helper'

class WorkPreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.create(user_id: @user.id, name: "Daniel",
      last_name: "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone:
      123456, residency_status: "Australian Resident", contract_type: "Casual")
    @position = Position.create(title: "Manager")
    @work_preference = WorkPreference.new(user_profile_id: @user_profile.id,
      position_id: @position.id, objectives: "Something")
  end

  test "should be valid" do
    assert @work_preference.valid?, @work_preference.errors.full_messages
  end

  test "should have an objectives" do
    @work_preference.objectives = nil
    assert @work_preference.valid?, @work_preference.errors.full_messages
  end

  test "objectives should not exceed 500char" do
    @work_preference.objectives = "n" * 501
    assert_not @work_preference.valid?, @work_preference.errors.full_messages
  end
end
