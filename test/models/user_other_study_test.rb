require 'test_helper'

class UserOtherStudyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @other_study = OtherStudy.create(title: "Stamp Collector")
    @user = User.create(email: "df@gmail.com", password: "123456")
    @user_profile = UserProfile.create(user_id: @user.id, name: "Daniel",
      last_name: "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone:
      123456, residency_status: "Australian Resident", contract_type: "Casual")
    @user_other_study = UserOtherStudy.new(user_profile_id: @user_profile.id,
                                           other_study_id:@other_study.id,
                                           study_type: "Other", start_date:
                                           "2005-01-15", end_date: "2010-12-15")
  end

  STUDY_TYPE = ["Certification", "License", "Course", "Other"]

  test "should be valid" do
    assert @user_other_study.valid?, @user_other_study.errors.full_messages
  end

  test "should have study_type" do
    @user_other_study.study_type = nil
    assert_not @user_other_study.valid?, @user_other_study.errors.full_messages
  end

  test "study_type should be included" do
    assert_includes STUDY_TYPE, @user_other_study.study_type,
                                @user_other_study.errors.full_messages
  end

  test "should have start_date" do
    @user_other_study.start_date = nil
    assert_not @user_other_study.valid?, @user_other_study.errors.full_messages
  end

  test "should have end_date" do
    @user_other_study.end_date = nil
    assert_not @user_other_study.valid?, @user_other_study.errors.full_messages
  end

end
