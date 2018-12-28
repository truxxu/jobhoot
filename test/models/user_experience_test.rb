require 'test_helper'

class UserExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.create(user_id: @user.id, name: "Daniel", last_name:
      "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone: 123456,
      residency_status: "Australian Resident", contract_type: "Casual")
    @position = Position.create(title: "Manager")
    @skill = Skill.create(name: "CAD Drawing", logo: "something.html")
    @user_experience = UserExperience.new(user_profile_id: @user_profile.id,
      position_id: @position.id, skill_id: @skill.id, status: "Finished",
      company_name: "Continental", contract_type: "Full Time", description:
      "something", start_date: "2005-01-15", end_date: "2010-12-15" )
  end

  EXP_STATUS = ["Currently Working", "Finished"]
  CONTRACT =   ["Casual", "Contractor", "Full Time", "Internship", "Part Time",
                "Volunteer", "Work Experience"]

  test "should be valid" do
    assert @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "status should be present" do
    @user_experience.status = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "status should be included" do
    assert_includes EXP_STATUS, @user_experience.status, @user_experience.errors.full_messages
  end

  test "company_name should be present" do
    @user_experience.company_name = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "contract_type should be present" do
    @user_experience.contract_type = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "contract_type should be included" do
    assert_includes CONTRACT, @user_experience.contract_type, @user_experience.errors.full_messages
  end

  test "description should be present" do
    @user_experience.description = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "start_date should be present" do
    @user_experience.start_date = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end

  test "end_date should be present" do
    @user_experience.end_date = nil
    assert_not @user_experience.valid?, @user_experience.errors.full_messages
  end
end
