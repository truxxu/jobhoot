require 'test_helper'

class UserStudyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.create(user_id: @user.id, name: "Daniel", last_name:
      "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone: 123456,
      residency_status: "Australian Resident", contract_type: "Casual")
    @study = Study.create(title: "Agronomics")
    @user_study = UserStudy.new(user_profile_id: @user_profile.id, study_id:
                                @study.id, status: "Completed", study_type:
                                "Master", start_date: "2005-01-15", end_date:
                                "2010-12-15")
  end

  STUDY_STATUS =  ["In Progress", "Completed"]
  STUDY_TYPE =    ["Year 9", "Year 10", "Year 11", "Year 12", "Certificate I",
                   "Certificate II", "Certificate III", "Certificate IV",
                   "Trainee", "Diploma", "Advanced Diploma", "Associate Degree",
                   "Bachelor", "Honours", "Graduate Certificate",
                   "Graduate Diploma", "Master", "Doctor", "Other"]

  test "should be valid" do
    assert @user_study.valid?, @user_study.errors.full_messages
  end

  test "status should be present" do
    @user_study.status = nil
    assert_not @user_study.valid?, @user_study.errors.full_messages
  end

  test "status should be included" do
    assert_includes STUDY_STATUS, @user_study.status, @user_study.errors.full_messages
  end

  test "study_type should be present" do
    @user_study.study_type = nil
    assert_not @user_study.valid?, @user_study.errors.full_messages
  end

  test "study_type should be included" do
    assert_includes STUDY_TYPE, @user_study.study_type, @user_study.errors.full_messages
  end

  test "start_date should be present" do
    @user_study.start_date = nil
    assert_not @user_study.valid?, @user_study.errors.full_messages
  end

  test "end_date should be present" do
    @user_study.end_date = nil
    assert_not @user_study.valid?, @user_study.errors.full_messages
  end
end
