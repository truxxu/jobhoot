require 'test_helper'

class UserLanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_languages_new_url
    assert_response :success
  end

end
