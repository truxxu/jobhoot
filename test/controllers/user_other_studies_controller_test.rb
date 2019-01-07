require 'test_helper'

class UserOtherStudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_other_studies_new_url
    assert_response :success
  end

  test "should get create" do
    get user_other_studies_create_url
    assert_response :success
  end

end
